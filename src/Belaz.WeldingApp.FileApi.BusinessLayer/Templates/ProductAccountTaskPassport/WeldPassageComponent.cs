using System.Globalization;
using Belaz.WeldingApp.FileApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using OxyPlot;
using OxyPlot.Axes;
using OxyPlot.Legends;
using OxyPlot.Series;
using OxyPlot.SkiaSharp;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.ProductAccountTaskPassport;

public class WeldPassageComponent : IComponent
{
    public WeldPassageComponent(
        WeldPassageInfoWithChart weldPassageInfoWithChart)
    {
        // WeldPassageInstructionInfo = weldPassageInstruction;
        // WeldPassageInfo = weldPassage;
        WeldPassageInfoWithChart = weldPassageInfoWithChart;
    }

    // public WeldPassageInstructionDto WeldPassageInstructionInfo { get; }
    //
    // public WeldPassageDto WeldPassageInfo { get; }

    public WeldPassageInfoWithChart WeldPassageInfoWithChart { get; set; }

    public void Compose(IContainer container)
    {
        container.Column(column =>
        {
            column.Item().PaddingTop(20);
            column.Spacing(10);

            column.Item().Element(ComposePreheatingTemperatureTable);
            column.Item().Element(ComposeWeldInfoTable);
            column.Item().Element(ComposeCharts);
            column.Item().Element(ComposeCurrencyAndVoltageTable);
        });
    }

    private void ComposePreheatingTemperatureTable(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            column
                .Item()
                .Text($"Слой №{WeldPassageInfoWithChart.WeldPassageInfo.Number}. {WeldPassageInfoWithChart.WeldPassageInfo.Name}.")
                .Style(Typography.Bold);

            column
                .Item()
                .Table(table =>
                {
                    table.ColumnsDefinition(columns =>
                    {
                        columns.RelativeColumn(3);
                        columns.RelativeColumn();
                        columns.RelativeColumn();
                    });

                    table.Header(header =>
                    {
                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text("Наименование параметра")
                            .Style(Typography.Normal);

                        table.Cell().Element(BlockLeft).Text("Значение").Style(Typography.Normal);

                        table
                            .Cell()
                            .Element(BlockLeft)
                            .Text("Обеспечение допуска")
                            .Style(Typography.Normal);
                    });

                    string ensuringAccessText;

                    if (
                        WeldPassageInfoWithChart.WeldPassageInstructionInfo.PreheatingTemperatureMax is null
                        || WeldPassageInfoWithChart.WeldPassageInstructionInfo.PreheatingTemperatureMin is null
                    )
                    {
                        ensuringAccessText = "-";
                    }
                    else
                    {
                        ensuringAccessText = DocumentExtensions.GetYesOrNoByCondition(
                            WeldPassageInfoWithChart.WeldPassageInfo.PreheatingTemperature
                            <= WeldPassageInfoWithChart.WeldPassageInstructionInfo.PreheatingTemperatureMax
                            && WeldPassageInfoWithChart.WeldPassageInfo.PreheatingTemperature
                            >= WeldPassageInfoWithChart.WeldPassageInstructionInfo.PreheatingTemperatureMin
                        );
                    }

                    table
                        .Cell()
                        .Element(BlockLeft)
                        .Text("Температура предварительного нагрева, °С")
                        .Style(Typography.Normal);

                    table
                        .Cell()
                        .Element(BlockCenter)
                        .Text(DocumentExtensions.CheckValueForEmptyOrNull(WeldPassageInfoWithChart.WeldPassageInfo.PreheatingTemperature))
                        .Style(Typography.Italic);

                    table
                        .Cell()
                        .Element(BlockCenter)
                        .Text(ensuringAccessText)
                        .Style(Typography.Italic);

                    static IContainer BlockCenter(IContainer container) =>
                        Table.BlockCenter(container);

                    static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
                });
        });
    }

    private void ComposeWeldInfoTable(IContainer container)
    {
        container.Table(table =>
        {
            table.ColumnsDefinition(columns =>
            {
                columns.RelativeColumn(3);
                columns.RelativeColumn();
                columns.RelativeColumn();
            });

            table.Header(header =>
            {
                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text("Наименование параметра")
                    .Style(Typography.Normal);

                table
                    .Cell()
                    .ColumnSpan(2)
                    .Element(BlockCenter)
                    .Text("Значение")
                    .Style(Typography.Normal);
            });

            table.Cell().Element(BlockLeft).Text("Время начала сварки").Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text(WeldPassageInfoWithChart.WeldPassageInfo.WeldingStartTime.ToHoursMinutesSecondsString())
                .Style(Typography.Italic);

            var weldingTimeSeconds = TimeSpan.FromSeconds(
                WeldPassageInfoWithChart.WeldPassageInfo.WeldingEndTime
                    .Subtract(WeldPassageInfoWithChart.WeldPassageInfo.WeldingStartTime)
                    .TotalSeconds
            );

            var weldTimeString = String.Format("{0:0.##}", weldingTimeSeconds.TotalSeconds / 60);

            table.Cell().Element(BlockLeft).Text("Время сварки, мин").Style(Typography.Normal);

            table
                .Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text(weldTimeString)
                .Style(Typography.Italic);

            table
                .Cell()
                .RowSpan(2)
                .Element(BlockLeft)
                .Text("Суммарное время выхода параметров за пределы допустимых значений, мин")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockCenter)
                .Text("Кратковременно, до 5 с.")
                .Style(Typography.Normal);

            table
                .Cell()
                .Element(BlockCenter)
                .Text("Длительно, свыше 5 с.")
                .Style(Typography.Normal);

            var shortTermDeviation = WeldPassageInfoWithChart.WeldPassageInfo.ShortTermDeviation is null
                ? "-"
                : String.Format("{0:0.##}", (double) WeldPassageInfoWithChart.WeldPassageInfo.ShortTermDeviation / 60);

            table
                .Cell()
                .Element(BlockCenter)
                .Text(shortTermDeviation)
                .Style(Typography.Italic);

            var longTermDeviation = WeldPassageInfoWithChart.WeldPassageInfo.LongTermDeviation is null
                ? "-"
                : String.Format("{0:0.##}", (double) WeldPassageInfoWithChart.WeldPassageInfo.LongTermDeviation / 60);

            table
                .Cell()
                .Element(BlockCenter)
                .Text(longTermDeviation)
                .Style(Typography.Italic);

            static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private void ComposeCharts(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            /*column.Item().Text("Графики").Style(Typography.Normal);*/

            var weldingCurrentChartImageBytes = WeldPassageInfoWithChart.WeldingCurrentChartImageBytes;
            column.Item().AlignCenter().Image(weldingCurrentChartImageBytes);

            var arcVoltageChartImageBytes = WeldPassageInfoWithChart.ArcVoltageChartImageBytes;
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

                var voltageParameterResult = GetParametersResult(
                    WeldPassageInfoWithChart.WeldPassageInfo.ArcVoltageValues,
                    WeldPassageInfoWithChart.WeldPassageInstructionInfo.ArcVoltageMin,
                    WeldPassageInfoWithChart.WeldPassageInstructionInfo.ArcVoltageMax
                );

                var currencyParameterResult = GetParametersResult(
                    WeldPassageInfoWithChart.WeldPassageInfo.WeldingCurrentValues,
                    WeldPassageInfoWithChart.WeldPassageInstructionInfo.WeldingCurrentMin,
                    WeldPassageInfoWithChart.WeldPassageInstructionInfo.WeldingCurrentMax
                );

                var isEnsuringCurrentAllowance = WeldPassageInfoWithChart.WeldPassageInfo.IsEnsuringCurrentAllowance;
                var isEnsuringVoltageAllowance = WeldPassageInfoWithChart.WeldPassageInfo.IsEnsuringVoltageAllowance;

                var ensuringAccessVoltageText = isEnsuringVoltageAllowance is null
                    ? "Да"
                    : ((bool) isEnsuringVoltageAllowance ? "Да" : "Нет");

                var ensuringAccessCurrentText = isEnsuringCurrentAllowance is null
                    ? "Да"
                    : ((bool) isEnsuringCurrentAllowance ? "Да" : "Нет");

                var estimation = WeldPassageInfoWithChart.WeldPassageInfo.Estimation;

                table.Cell().Element(BlockLeft).Text("Сварочный ток, А").Style(Typography.Normal);

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

                table.Cell().Element(BlockLeft).Text("Оценка").Style(Typography.Bold);

                table.Cell().Element(BlockLeft).Text("-").Style(Typography.Normal);

                table.Cell().Element(BlockLeft).Text("-").Style(Typography.Normal);

                table
                    .Cell()
                    .Element(BlockLeft)
                    .Text(DocumentExtensions.CheckValueForNull(estimation))
                    .Style(Typography.ItalicBold);

                table.Cell().Element(BlockLeft).Text("-").Style(Typography.Normal);
            });

            static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
            static IContainer BlockLeft(IContainer container) => Table.BlockLeft(container);
        });
    }

    private TextStyle GetEnsuringAccessTextStyle(string ensuringAccess)
    {
        return ensuringAccess == "Да" ? Typography.Italic : Typography.ItalicBold;
    }

    private ParametersResult GetParametersResult(double[] values, double? min, double? max)
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

    // private byte[] GetArcVoltageChartImageByte(
    //     string measurementUnit,
    //     string title,
    //     string mainPlotTitle,
    //     double[] values,
    //     double? min,
    //     double? max
    // )
    // {
    //     var model = new PlotModel
    //     {
    //         Title = $"{title}, {measurementUnit}",
    //         DefaultFont = "Arial",
    //         TitleFontWeight = FontWeights.Bold,
    //         TitleFontSize = 22
    //     };
    //
    //     model.Legends.Add(
    //         new Legend
    //         {
    //             LegendPlacement = LegendPlacement.Outside,
    //             LegendPosition = LegendPosition.TopCenter,
    //             LegendOrientation = LegendOrientation.Horizontal,
    //             LegendLineSpacing = 8,
    //             LegendFontSize = 15
    //         }
    //     );
    //
    //     var main = new LineSeries
    //     {
    //         Title = $"{mainPlotTitle}, {measurementUnit}",
    //         Color = OxyColors.Red,
    //         StrokeThickness = 2,
    //     };
    //
    //     var weldingStartTimeTemp = WeldPassageInfo.WeldingStartTime;
    //     var times = values
    //         .Select(x =>
    //         {
    //             var time = weldingStartTimeTemp;
    //             weldingStartTimeTemp = weldingStartTimeTemp.Add(TimeSpan.FromSeconds(0.1));
    //             return time;
    //         })
    //         .ToArray();
    //
    //     var startTime = times.First();
    //     var endTime = times.Last();
    //
    //     //var seconds = (int)Math.Round(endTime.Subtract(startTime).TotalSeconds);
    //
    //     var minValueTime = TimeSpanAxis.ToDouble(startTime);
    //     var maxValueTime = TimeSpanAxis.ToDouble(endTime.Add(TimeSpan.FromSeconds(1)));
    //
    //     var step = Math.Round((maxValueTime - minValueTime) / (double) 28, 2);
    //
    //     if (max is not null && min is not null)
    //     {
    //         var maxLine = GetStraightLine(
    //             $"Максимум, {measurementUnit}",
    //             OxyColors.Blue,
    //             startTime,
    //             endTime,
    //             (double) max
    //         );
    //
    //         var minLine = GetStraightLine(
    //             $"Минимум, {measurementUnit}",
    //             OxyColors.Green,
    //             startTime,
    //             endTime,
    //             (double) min
    //         );
    //
    //         model.Series.Add(maxLine);
    //         model.Series.Add(minLine);
    //     }
    //
    //     for (int i = 0; i < values.Length; i++)
    //     {
    //         main.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(times[i]), values[i]));
    //     }
    //
    //     model.Series.Add(main);
    //
    //     var minValue = values.Min();
    //     var maximumAxes =
    //         (values.Max() + 10 < max) && max is not null ? (double) max + 10 : values.Max() + 10;
    //
    //     var minimumAxes = min < minValue && min is not null ? (double) min - 10 : minValue - 10;
    //
    //     var valuesDifference = maximumAxes - minimumAxes;
    //     var leftAxesStep = 10;
    //
    //     if (valuesDifference / 10 > 15)
    //     {
    //         leftAxesStep = (int) (valuesDifference / 15);
    //     }
    //
    //     model.Axes.Add(
    //         new LinearAxis
    //         {
    //             Position = AxisPosition.Left,
    //             MajorGridlineColor = OxyColors.Gray,
    //             MajorGridlineStyle = LineStyle.Solid,
    //             MajorGridlineThickness = 1,
    //             Minimum = minimumAxes,
    //             Maximum = maximumAxes,
    //             MajorStep = leftAxesStep,
    //             FontSize = 14,
    //         }
    //     );
    //
    //     model.Axes.Add(
    //         new TimeSpanAxis()
    //         {
    //             ExtraGridlines = new[] {0.0},
    //             Position = AxisPosition.Bottom,
    //             Minimum = minValueTime,
    //             Maximum = maxValueTime,
    //             StringFormat = "hh:mm:ss",
    //             MajorStep = TimeSpanAxis.ToDouble(TimeSpan.FromSeconds(step)),
    //             Angle = -45,
    //             FontSize = 14,
    //             StartPosition = 0.015,
    //             MajorGridlineColor = OxyColors.Gray,
    //             MajorGridlineStyle = LineStyle.Solid,
    //             MajorGridlineThickness = 1,
    //         }
    //     );
    //
    //     using var stream = new MemoryStream();
    //     var exporterPng = new PngExporter
    //     {
    //         Width = 1300,
    //         Height = 700,
    //         Dpi = 150,
    //     };
    //
    //     exporterPng.Export(model, stream);
    //
    //     var bytes = stream.ToArray();
    //     return bytes;
    // }
    //
    // private LineSeries GetStraightLine(
    //     string title,
    //     OxyColor color,
    //     TimeSpan startTime,
    //     TimeSpan endTime,
    //     double value
    // )
    // {
    //     var line = new LineSeries()
    //     {
    //         Title = title,
    //         Color = color,
    //         StrokeThickness = 2,
    //     };
    //
    //     line.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(startTime), value));
    //     line.Points.Add(
    //         new DataPoint(TimeSpanAxis.ToDouble(endTime.Add(TimeSpan.FromSeconds(2))), value)
    //     );
    //
    //     return line;
    // }
}