using System.Globalization;
using Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Models;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OxyPlot;
using OxyPlot.Axes;
using OxyPlot.Legends;
using OxyPlot.Series;
using OxyPlot.SkiaSharp;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.BasedSeamPassport;

public class BasedWeldPassageComponent : IComponent
{
    private readonly double _averageIntervalSeconds;
    private readonly double _secondsToIgnoreBetweenGraphs;
    private readonly int? _weldPassageNumber;

    private Values _recordValues;
    private TimeSpan _startWeldingTime;
    private TimeSpan _endWeldingTime;

    public List<WeldPassageDto> WeldPassages { get; }

    public List<WeldPassageInstructionDto> Instructions { get; }

    public BasedWeldPassageComponent(List<WeldPassageDto> weldPassage,
        double? averageIntervalSeconds,
        double? secondsToIgnoreBetweenGraphs,
        List<WeldPassageInstructionDto> instructions,
        int? weldPassageNumber)
    {
        WeldPassages = weldPassage;
        Instructions = instructions;
        _weldPassageNumber = weldPassageNumber;
        _averageIntervalSeconds = averageIntervalSeconds ?? 5;
        _secondsToIgnoreBetweenGraphs = secondsToIgnoreBetweenGraphs ?? 60;
    }

    public void Compose(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(10);

            _startWeldingTime = WeldPassages.First().WeldingStartTime;
            _endWeldingTime = WeldPassages.Last().WeldingEndTime;
            _recordValues = GetAllRecordsInOne();


            column.Item().Element(ComposeCurrencyAndVoltageTable);
            column.Item().Element(ComposeCharts);
        });
    }

    private void ComposeCharts(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            var weldPassageLineInfo = GetWeldPassageLineInfos(_recordValues, Instructions);

            var weldingCurrentChartImageBytes = GetArcVoltageChartImageByte(
                "А",
                $"Показания сварочного тока{(_weldPassageNumber.HasValue ? $" для слоя №{_weldPassageNumber}" : "")}",
                "Показания силы тока",
                _recordValues.WeldingCurrentValues.Select(_ => _.Value).ToArray(),
                weldPassageLineInfo.amperages.ToList()
            );
            column.Item().AlignCenter().Image(weldingCurrentChartImageBytes);

            // var weldingCurrentDeviations = WeldPassages
            //     .SelectMany(_ =>
            //         CalculateTermDeviation(
            //             _.WeldingStartTime,
            //             _.WeldingCurrentValues,
            //             Instruction?.WeldingCurrentMin ?? null,
            //             Instruction?.WeldingCurrentMax ?? null))
            //     .ToList();

            // foreach (var weldingCurrentDeviation in weldingCurrentDeviations)
            // {
            //     column.Item().Element(_ => ComposeDeviationValuesTable(_, weldingCurrentDeviation));
            //     column.Spacing(10);
            // }

            var arcVoltageChartImageBytes = GetArcVoltageChartImageByte(
                "В",
                $"Показания напряжения на дуге{(_weldPassageNumber.HasValue ? $" для слоя №{_weldPassageNumber}" : "")}",
                "Показания напряжения",
                _recordValues.ArcVoltageValues.Select(_ => _.Value).ToArray(),
                weldPassageLineInfo.voltages.ToList()
            );
            column.Item().AlignCenter().Image(arcVoltageChartImageBytes);

            // var arcVoltageDeviations = WeldPassages
            //     .SelectMany(_ =>
            //         CalculateTermDeviation(
            //             _.WeldingStartTime,
            //             _.ArcVoltageValues,
            //             Instruction?.ArcVoltageMin ?? null,
            //             Instruction?.ArcVoltageMax ?? null))
            //     .ToList();

            // foreach (var arcVoltageDeviation in arcVoltageDeviations)
            // {
            //     column.Item().Element(_ => ComposeDeviationValuesTable(_, arcVoltageDeviation));
            //     column.Spacing(10);
            // }
        });
    }

    private void ComposeDeviationValuesTable(IContainer container, WeldingDeviationValues deviationValue)
    {
        var columnsAmount = 19;

        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn(2.5f);

                for (var i = 0; i < columnsAmount - 1; i++)
                {
                    columns.RelativeColumn();
                }
            });

            table
                .Cell()
                .ColumnSpan(5)
                .Element(BlockCenter)
                .Text("Время начала")
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(4)
                .Element(BlockCenter)
                .Text(deviationValue.DeviationStart.ToHoursMinutesSecondsString())
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(6)
                .Element(BlockCenter)
                .Text("Время окончания")
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(4)
                .Element(BlockCenter)
                .Text(deviationValue.DeviationEnd.ToHoursMinutesSecondsString())
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(5)
                .Element(BlockCenter)
                .Text("Минимальное значение")
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(4)
                .Element(BlockCenter)
                .Text(deviationValue.MinInstruction.ToString(CultureInfo.InvariantCulture))
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(6)
                .Element(BlockCenter)
                .Text("Максимальное значение")
                .Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(4)
                .Element(BlockCenter)
                .Text(deviationValue.MaxInstruction.ToString(CultureInfo.InvariantCulture))
                .Style(Typography.Normal);

            var groupSize = columnsAmount - 1;

            var deviationValueSet = GetDeviationValueSets(groupSize,
                deviationValue.Values,
                deviationValue.DeviationValues);

            foreach (var groupedArray in deviationValueSet)
            {
                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text("Значение")
                    .Style(Typography.Normal);

                for (int i = 0; i < groupSize; i++)
                {
                    var valueString = i > groupedArray.Values.Length - 1
                        ? "-"
                        : groupedArray.Values[i].ToString(CultureInfo.InvariantCulture);

                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text(valueString)
                        .Style(Typography.Normal);
                }

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text("Отклонение")
                    .Style(Typography.Normal);

                for (int i = 0; i < groupSize; i++)
                {
                    var valueString = i > groupedArray.DeviationValues.Length - 1
                        ? "-"
                        : groupedArray.DeviationValues[i].ToString(CultureInfo.InvariantCulture);

                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text(valueString)
                        .Style(Typography.Normal);
                }
            }

            static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeCurrencyAndVoltageTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn(1.5f);
                columns.RelativeColumn();
                columns.RelativeColumn();
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table.Header(header =>
            {
                table
                    .Cell()
                    .RowSpan(2)
                    .Element(BlockLeft)
                    .Text("Наименование параметра")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .ColumnSpan(3)
                    .Element(BlockCenter)
                    .Text("Значение")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .RowSpan(2)
                    .Element(BlockLeft)
                    .Text("Обеспечение допуска")
                    .Style(Typography.Normal);

                table.Cell().Element(BlockLeft).Text("Минимальное").Style(Typography.Normal);

                table.Cell().Element(BlockLeft).Text("Максимальное").Style(Typography.Normal);

                table.Cell().Element(BlockLeft).Text("Среднее").Style(Typography.Normal);

                var voltageParameterResult = GetParametersResult(WeldPassages
                    .SelectMany(_ => _.ArcVoltageValues)
                    .ToArray());

                var currencyParameterResult = GetParametersResult(WeldPassages
                    .SelectMany(_ => _.WeldingCurrentValues)
                    .ToArray());

                var estimation = CalculateAverageEstimation(WeldPassages);

                var ensuringAccessVoltageText = WeldPassages
                    .All(_ => !_.IsEnsuringVoltageAllowance.HasValue)
                    ? "-"
                    : WeldPassages.All(_ =>
                        _.IsEnsuringVoltageAllowance.HasValue && _.IsEnsuringVoltageAllowance.Value)
                        ? "Да"
                        : "Нет";

                var ensuringAccessCurrentText = WeldPassages
                    .All(_ => !_.IsEnsuringCurrentAllowance.HasValue)
                    ? "-"
                    : WeldPassages.All(_ =>
                        _.IsEnsuringCurrentAllowance.HasValue && _.IsEnsuringCurrentAllowance.Value)
                        ? "Да"
                        : "Нет";

                var hasTemperatureValues = WeldPassages.Any(_ => _.IsEnsuringTemperatureAllowance.HasValue);

                var ensuringAccessTemperatureText = !hasTemperatureValues
                    ? "-"
                    : WeldPassages.All(_ =>
                        _.IsEnsuringTemperatureAllowance.HasValue && _.IsEnsuringTemperatureAllowance.Value)
                        ? "Да"
                        : "Нет";


                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text("Температура предварительного нагрева, ◦С")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(hasTemperatureValues ? $"{WeldPassages.Min(_ => _.PreheatingTemperature):0.00}" : "-")
                    .Style(Typography.Italic);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(hasTemperatureValues ? $"{WeldPassages.Max(_ => _.PreheatingTemperature):0.00}" : "-")
                    .Style(Typography.Italic);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(hasTemperatureValues ? $"{WeldPassages.Average(_ => _.PreheatingTemperature):0.00}" : "-")
                    .Style(Typography.ItalicBold);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(ensuringAccessTemperatureText)
                    .Style(GetEnsuringAccessTextStyle(ensuringAccessTemperatureText));

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text("Сварочный ток, А")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(currencyParameterResult.Min.ToString(CultureInfo.InvariantCulture))
                    .Style(Typography.Italic);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(currencyParameterResult.Max.ToString(CultureInfo.InvariantCulture))
                    .Style(Typography.Italic);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(currencyParameterResult.Average.ToString(CultureInfo.InvariantCulture))
                    .Style(Typography.ItalicBold);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(ensuringAccessCurrentText)
                    .Style(GetEnsuringAccessTextStyle(ensuringAccessCurrentText));

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text("Напряжение на дуге, В")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(voltageParameterResult.Min.ToString(CultureInfo.InvariantCulture))
                    .Style(Typography.Italic);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(voltageParameterResult.Max.ToString(CultureInfo.InvariantCulture))
                    .Style(Typography.Italic);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(voltageParameterResult.Average.ToString(CultureInfo.InvariantCulture))
                    .Style(Typography.ItalicBold);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(ensuringAccessVoltageText)
                    .Style(GetEnsuringAccessTextStyle(ensuringAccessVoltageText));

                table.Cell().Element(BlockLeft)
                    .Text("Оценка")
                    .Style(Typography.Bold);

                table.Cell().Element(BlockLeft)
                    .Text($"{WeldPassages.Min(_ => _.Estimation):0.00}")
                    .Style(Typography.Normal);

                table.Cell().Element(BlockLeft)
                    .Text($"{WeldPassages.Max(_ => _.Estimation):0.00}")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text($"{estimation:0.00}")
                    .Style(Typography.ItalicBold);

                table.Cell().Element(BlockLeft).Text("-").Style(Typography.Normal);
            });

            static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private ParametersResult GetParametersResult(double[] values)
    {
        var valueMin = Math.Round(values.Min(), 2);
        var valueMax = Math.Round(values.Max(), 2);
        var valueAverage = Math.Round(values.Average(), 2);

        return new ParametersResult
        {
            Average = valueAverage,
            Min = valueMin,
            Max = valueMax,
        };
    }

    private byte[] GetArcVoltageChartImageByte(
        string measurementUnit,
        string title,
        string mainPlotTitle,
        double[] values,
        IReadOnlyList<WeldPassageLineInfo> weldPassageLineInfos
        // double? min,
        //     double? max
    )
    {
        var model = new PlotModel
        {
            Title = $"{title}, {measurementUnit}",
            DefaultFont = "Arial",
            TitleFontWeight = FontWeights.Bold,
            TitleFontSize = 22
        };

        model.Legends.Add(
            new Legend
            {
                LegendPlacement = LegendPlacement.Outside,
                LegendPosition = LegendPosition.TopCenter,
                LegendOrientation = LegendOrientation.Horizontal,
                LegendLineSpacing = 8,
                LegendFontSize = 15
            }
        );

        var main = new LineSeries
        {
            Title = $"{mainPlotTitle}, {measurementUnit}",
            Color = OxyColors.Red,
            StrokeThickness = 2,
        };

        var secondPerValue = (_endWeldingTime - _startWeldingTime).TotalSeconds / values.Length();

        var weldingStartTimeTemp = _startWeldingTime;
        var times = values
            .Select(x =>
            {
                var time = weldingStartTimeTemp;
                weldingStartTimeTemp = weldingStartTimeTemp
                    .Add(TimeSpan.FromSeconds(secondPerValue));
                return time;
            })
            .ToArray();

        var minValueTime = TimeSpanAxis.ToDouble(_startWeldingTime);
        var maxValueTime = TimeSpanAxis.ToDouble(_endWeldingTime);

        var step = Math.Round((maxValueTime - minValueTime) / (double)28, 2);

        var displayTitleMap = weldPassageLineInfos
            .Select(_ => _.WeldPassageNumber)
            .Distinct()
            .ToDictionary(x => x, _ => true);

        for (int i = 0; i < values.Length; i++)
        {
            main.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(times[i]), values[i]));
        }

        model.Series.Add(main);
        
        foreach (var weldPassageLine in weldPassageLineInfos)
        {
            if (weldPassageLine.Max is null || weldPassageLine.Min is null)
            {
                continue;
            }

            var isTitleDisplay = displayTitleMap[weldPassageLine.WeldPassageNumber];

            var minLine = GetStraightLine(
                $"Минимум для слоя №{weldPassageLine.WeldPassageNumber}, {measurementUnit}",
                weldPassageLine.MinColor,
                weldPassageLine.StartTime,
                weldPassageLine.EndTime,
                weldPassageLine.Min.Value,
                isTitleDisplay
            );

            var maxLine = GetStraightLine(
                $"Максимум для слоя №{weldPassageLine.WeldPassageNumber}, {measurementUnit}",
                weldPassageLine.MaxColor,
                weldPassageLine.StartTime,
                weldPassageLine.EndTime,
                weldPassageLine.Max.Value,
                isTitleDisplay
            );

            if (isTitleDisplay)
            {
                displayTitleMap[weldPassageLine.WeldPassageNumber] = false;
            }

            model.Series.Add(minLine);
            model.Series.Add(maxLine);
        }

        var max = weldPassageLineInfos.Any(_ => _.Max.HasValue)
            ? weldPassageLineInfos.Max(_ => _.Max)
            : null;
        var min = weldPassageLineInfos.Any(_ => _.Min.HasValue)
            ? weldPassageLineInfos.Max(_ => _.Min)
            : null;

        var minValue = values.Min();
        var maximumAxes =
            (values.Max() + 10 < max) && max.HasValue ? (double)max + 10 : values.Max() + 10;

        var minimumAxes = min < minValue && min.HasValue ? (double)min - 10 : minValue - 10;

        var valuesDifference = maximumAxes - minimumAxes;
        var leftAxesStep = 10;

        if (valuesDifference / 10 > 15)
        {
            leftAxesStep = (int)(valuesDifference / 15);
        }

        model.Axes.Add(
            new LinearAxis
            {
                Position = AxisPosition.Left,
                MajorGridlineColor = OxyColors.Gray,
                MajorGridlineStyle = LineStyle.Solid,
                MajorGridlineThickness = 1,
                Minimum = minimumAxes,
                Maximum = maximumAxes,
                MajorStep = leftAxesStep,
                FontSize = 14,
            }
        );

        model.Axes.Add(
            new TimeSpanAxis()
            {
                ExtraGridlines = new[] { 0.0 },
                Position = AxisPosition.Bottom,
                Minimum = minValueTime,
                Maximum = maxValueTime,
                StringFormat = "hh:mm:ss",
                MajorStep = TimeSpanAxis.ToDouble(TimeSpan.FromSeconds(step)),
                Angle = -45,
                FontSize = 14,
                StartPosition = 0.015,
                MajorGridlineColor = OxyColors.Gray,
                MajorGridlineStyle = LineStyle.Solid,
                MajorGridlineThickness = 1,
            }
        );

        using var stream = new MemoryStream();
        var exporterPng = new PngExporter
        {
            Width = 1300,
            Height = 700,
            Dpi = 150,
        };

        exporterPng.Export(model, stream);

        var bytes = stream.ToArray();
        return bytes;
    }

    private Values GetAllRecordsInOne()
    {
        var valuesLenght = WeldPassages.Count;

        var resultAmperages = new List<WeldingValue>();
        var resultVoltages = new List<WeldingValue>();

        for (var i = 0; i < valuesLenght; i++)
        {
            var amperages = ValueAverager
                .GetAveragedValues(WeldPassages[i].WeldingCurrentValues, 0.1,
                    _averageIntervalSeconds);
            var voltages = ValueAverager
                .GetAveragedValues(WeldPassages[i].ArcVoltageValues, 0.1,
                    _averageIntervalSeconds);

            resultAmperages.AddRange(amperages.Select(_ => new WeldingValue(_, WeldPassages[i].Number)));
            resultVoltages.AddRange(voltages.Select(_ => new WeldingValue(_, WeldPassages[i].Number)));

            if (i >= valuesLenght - 2)
            {
                continue;
            }

            var endTime = WeldPassages[i].WeldingEndTime;
            var nextStartTime = WeldPassages[i + 1].WeldingStartTime;

            var totalSeconds = (nextStartTime - endTime).TotalSeconds;

            if (totalSeconds <= _secondsToIgnoreBetweenGraphs)
            {
                continue;
            }

            var valuesAmount = (int)(totalSeconds / _averageIntervalSeconds);

            var zeroValues = Enumerable.Repeat(0.0, valuesAmount).ToArray();

            resultAmperages.AddRange(zeroValues.Select(_ => new WeldingValue(_)));
            resultVoltages.AddRange(zeroValues.Select(_ => new WeldingValue(_)));
        }

        var secondPerValue = (_endWeldingTime - _startWeldingTime).TotalSeconds / resultAmperages.Length();
        var endTimeResu = _startWeldingTime.Add(TimeSpan.FromSeconds(secondPerValue * resultAmperages.Length()));
        var endTimeResusdfdsf = _startWeldingTime.Add(TimeSpan.FromSeconds(secondPerValue * 3375));

        return new Values
        {
            ArcVoltageValues = resultVoltages.ToArray(),
            WeldingCurrentValues = resultAmperages.ToArray(),
        };
    }

    private double CalculateAverageEstimation(List<WeldPassageDto> weldPassages)
    {
        var weldingTimesMinute = weldPassages
            .Select(wp => wp.WeldingEndTime - wp.WeldingStartTime)
            .Select(timeSpan => timeSpan.TotalMinutes)
            .ToList();

        var minTime = weldingTimesMinute.Min();
        var maxTime = weldingTimesMinute.Max();

        if (Math.Abs(maxTime - minTime) == 0)
        {
            var result = (double)weldPassages.Sum(_ => _.Estimation)! / weldPassages.Count;
            return result;
        }

        var totalNormalizeTime = 0.0;
        var totalEstimationMultiplyNormalizeTime = 0.0;

        foreach (var weldPassage in weldPassages)
        {
            var weldingTimeMinutes = (
                weldPassage.WeldingEndTime
                - weldPassage.WeldingStartTime
            ).TotalMinutes;
            var estimation = weldPassage.Estimation;

            var normalizeTime = (weldingTimeMinutes - minTime) / (maxTime - minTime);

            totalNormalizeTime += normalizeTime;
            totalEstimationMultiplyNormalizeTime += estimation * normalizeTime;
        }

        return totalEstimationMultiplyNormalizeTime / totalNormalizeTime;
    }

    private List<WeldingDeviationValues> CalculateTermDeviation(TimeSpan weldingStart,
        double[] values,
        double? min,
        double? max)
    {
        if (min is null || max is null)
        {
            return new List<WeldingDeviationValues>();
        }

        int countSequential = 0;

        var weldingDeviationValues = new List<WeldingDeviationValues>();

        for (var i = 0; i < values.Length; i++)
        {
            if (values[i] < min || values[i] > max)
            {
                countSequential++;

                if (i != values.Length - 1)
                    continue;
            }

            if (countSequential > 50)
            {
                var endIndex = i - 1;
                var startIndex = endIndex - countSequential + 1;

                var startTime = weldingStart.Add(TimeSpan.FromSeconds(startIndex * 0.1));
                var endTime = startTime.Add(TimeSpan.FromSeconds(countSequential * 0.1));

                var resultValues = values
                    .Skip(startIndex)
                    .Take(countSequential)
                    .ToArray();

                var deviationValues = new double[resultValues.Length];

                for (var j = 0; j < resultValues.Length; j++)
                {
                    if (resultValues[j] > max)
                    {
                        deviationValues[j] = resultValues[j] - max.Value;
                        continue;
                    }

                    if (resultValues[j] < min)
                    {
                        deviationValues[j] = resultValues[j] - min.Value;
                    }
                }

                weldingDeviationValues.Add(new WeldingDeviationValues
                {
                    DeviationEnd = endTime,
                    DeviationStart = startTime,
                    Values = resultValues,
                    DeviationValues = deviationValues,
                    MinInstruction = min.Value,
                    MaxInstruction = max.Value,
                });
            }

            countSequential = 0;
        }

        return weldingDeviationValues;
    }

    private List<DeviationValueSet> GetDeviationValueSets(int groupSize, double[] weldingValues,
        double[] weldingDeviationValues)
    {
        var groupsAmount = weldingValues.Length / groupSize;
        var deviationValueSet = new List<DeviationValueSet>();

        for (int i = 0; i < groupsAmount; i++)
        {
            if (i != groupsAmount - 1)
            {
                var values = weldingValues
                    .Skip(i * groupSize)
                    .Take(groupSize);
                var deviationValues = weldingDeviationValues
                    .Skip(i * groupSize)
                    .Take(groupSize);

                deviationValueSet.Add(new DeviationValueSet(values.ToArray(), deviationValues.ToArray()));
                continue;
            }

            var lastValues = weldingValues
                .Skip(i * groupSize)
                .ToArray();
            var lastDeviationValues = weldingDeviationValues
                .Skip(i * groupSize)
                .ToArray();

            if (lastValues.Length() > groupSize)
            {
                deviationValueSet.Add(new DeviationValueSet(lastValues
                        .Take(groupSize)
                        .ToArray(),
                    lastDeviationValues
                        .Take(groupSize)
                        .ToArray()));

                deviationValueSet.Add(new DeviationValueSet(lastValues
                        .Skip(groupSize)
                        .ToArray(),
                    lastDeviationValues
                        .Skip(groupSize)
                        .ToArray()));
                continue;
            }

            deviationValueSet.Add(new DeviationValueSet(lastValues, lastDeviationValues));
        }

        return deviationValueSet;
    }

    private (IReadOnlyCollection<WeldPassageLineInfo> amperages, IReadOnlyCollection<WeldPassageLineInfo> voltages)
        GetWeldPassageLineInfos(
            Values weldingValues,
            IList<WeldPassageInstructionDto> instructions)
    {
        var amperagesResult = new List<WeldPassageLineInfo>();
        var voltagesResult = new List<WeldPassageLineInfo>();

        var asasd = weldingValues.WeldingCurrentValues
            .Select((_, i) => new { WeldPassageNumber = _.WeldPassageNumber, Value = _.Value, Index = i });

        var weldPassageWithIndex = weldingValues.WeldingCurrentValues
            .Select((_, index) => new { Index = index, WeldPassageNumber = _.WeldPassageNumber })
            .Where(_ => _.WeldPassageNumber.HasValue)
            .Select(_ => new WeldPassageNumberWithIndex(_.WeldPassageNumber!.Value, _.Index))
            .ToArray();

        var valueLength = weldPassageWithIndex.Length();
        var secondPerValue = (_endWeldingTime - _startWeldingTime).TotalSeconds /
                             weldingValues.WeldingCurrentValues.Length();

        var firstWeldPassageNumberWithIndex = weldPassageWithIndex.First();

        var lastWeldPassageNumberWithIndex = weldPassageWithIndex.Last();

        var startTime = _startWeldingTime;
        var lastIndex = firstWeldPassageNumberWithIndex.Index;

        var lastWeldPassageNumber = firstWeldPassageNumberWithIndex.WeldPassageNumber;

        for (var i = firstWeldPassageNumberWithIndex.Index; i < valueLength; i++)
        {
            if (lastWeldPassageNumber == weldPassageWithIndex[i].WeldPassageNumber)
            {
                continue;
            }

            var instruction = instructions.FirstOrDefault(_ => _.Number == lastWeldPassageNumber)!;
            var endTime = _startWeldingTime.Add(TimeSpan
                .FromSeconds((weldPassageWithIndex[i - 1].Index + 1) * secondPerValue));

            amperagesResult.Add(new WeldPassageLineInfo(lastWeldPassageNumber,
                instruction.WeldingCurrentMin,
                instruction.WeldingCurrentMax,
                startTime, endTime));

            voltagesResult.Add(new WeldPassageLineInfo(lastWeldPassageNumber,
                instruction.ArcVoltageMin,
                instruction.ArcVoltageMax,
                startTime, endTime));

            startTime = _startWeldingTime.Add(TimeSpan
                .FromSeconds((weldPassageWithIndex[i].Index + 1) * secondPerValue));
            lastWeldPassageNumber = weldPassageWithIndex[i].WeldPassageNumber;
        }

        if (lastWeldPassageNumber == lastWeldPassageNumberWithIndex.WeldPassageNumber)
        {
            var instruction = instructions.FirstOrDefault(_ => _.Number == lastWeldPassageNumber)!;
            var endTime = _endWeldingTime;

            amperagesResult.Add(new WeldPassageLineInfo(lastWeldPassageNumber,
                instruction.WeldingCurrentMin,
                instruction.WeldingCurrentMax,
                startTime, endTime));

            voltagesResult.Add(new WeldPassageLineInfo(lastWeldPassageNumber,
                instruction.ArcVoltageMin,
                instruction.ArcVoltageMax,
                startTime, endTime));
        }

        return (amperagesResult, voltagesResult);
    }

    private LineSeries GetStraightLine(
        string title,
        OxyColor color,
        TimeSpan startTime,
        TimeSpan endTime,
        double value,
        bool isTitleDisplay
    )
    {
        var line = new LineSeries
        {
            Title = isTitleDisplay ? title : null,
            Color = color,
            StrokeThickness = 2,
        };

        var lineStartTime = startTime.Add(TimeSpan.FromMinutes(-1));
        var lineEndTime = endTime.Add(TimeSpan.FromMinutes(1));

        line.Points.Add(new DataPoint(
            TimeSpanAxis.ToDouble(lineStartTime <= _startWeldingTime ? _startWeldingTime : lineStartTime), value));
        line.Points.Add(
            new DataPoint(TimeSpanAxis.ToDouble(lineEndTime >= _endWeldingTime ? _endWeldingTime : lineEndTime), value)
        );

        return line;
    }

    private TextStyle GetEnsuringAccessTextStyle(string ensuringAccess)
    {
        return ensuringAccess == "Да" ? Typography.Italic : Typography.ItalicBold;
    }
}