using System.Globalization;
using Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Models;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
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

    private Values recordValues;
    private TimeSpan startWeldingTime;
    private TimeSpan endWeldingTime;

    public List<WeldPassageDto> WeldPassages { get; }

    public BasedWeldPassageComponent(List<WeldPassageDto> weldPassage,
        double? averageIntervalSeconds,
        double? secondsToIgnoreBetweenGraphs)
    {
        WeldPassages = weldPassage;
        _averageIntervalSeconds = averageIntervalSeconds ?? 5;
        _secondsToIgnoreBetweenGraphs = secondsToIgnoreBetweenGraphs ?? 0;
    }

    public void Compose(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(10);

            recordValues = GetAllRecordsInOne();
            startWeldingTime = WeldPassages.First().WeldingStartTime;
            endWeldingTime = WeldPassages.Last().WeldingEndTime;
            
            column.Item().Element(ComposeCurrencyAndVoltageTable);
            column.Item().Element(ComposeCharts);
        });
    }

    private void ComposeCharts(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            var weldingCurrentChartImageBytes = GetArcVoltageChartImageByte(
                "А",
                $"Показания сварочного тока",
                "Показания силы тока",
                recordValues.WeldingCurrentValues
            );
            column.Item().AlignCenter().Image(weldingCurrentChartImageBytes);

            var arcVoltageChartImageBytes = GetArcVoltageChartImageByte(
                "В",
                $"Показания напряжения на дуге",
                "Показания напряжения",
                recordValues.ArcVoltageValues
            );
            column.Item().AlignCenter().Image(arcVoltageChartImageBytes);
        });
    }

    private void ComposeCurrencyAndVoltageTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn(1.3f);
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

                table.Cell().Element(BlockLeft).Text("Оценка").Style(Typography.Bold);

                table.Cell().Element(BlockLeft).Text("-").Style(Typography.Normal);

                table.Cell().Element(BlockLeft).Text("-").Style(Typography.Normal);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(DocumentExtensions.CheckValueForNull(Math.Round(estimation, 2)))
                    .Style(Typography.ItalicBold);
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
        double[] values
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

        var weldingStartTimeTemp = startWeldingTime;
        var times = values
            .Select(x =>
            {
                var time = weldingStartTimeTemp;
                weldingStartTimeTemp = weldingStartTimeTemp
                    .Add(TimeSpan.FromSeconds(_averageIntervalSeconds));
                return time;
            })
            .ToArray();

        var minValueTime = TimeSpanAxis.ToDouble(startWeldingTime);
        var maxValueTime = TimeSpanAxis.ToDouble(endWeldingTime);

        var step = Math.Round((maxValueTime - minValueTime) / (double)28, 2);

        for (int i = 0; i < values.Length; i++)
        {
            main.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(times[i]), values[i]));
        }

        model.Series.Add(main);

        var minValue = values.Min();
        var maximumAxes = values.Max() + 10;

        var minimumAxes = minValue - 10;

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

        var resultAmperages = new List<double>();
        var resultVoltages = new List<double>();

        for (var i = 0; i < valuesLenght; i++)
        {
            var amperages = ValueAverager
                .GetAveragedValues(WeldPassages[i].WeldingCurrentValues, 0.1,
                    _averageIntervalSeconds);
            var voltages = ValueAverager
                .GetAveragedValues(WeldPassages[i].ArcVoltageValues, 0.1,
                    _averageIntervalSeconds);

            resultAmperages.AddRange(amperages);
            resultVoltages.AddRange(voltages);

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

            resultAmperages.AddRange(zeroValues);
            resultVoltages.AddRange(zeroValues);
        }

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
}