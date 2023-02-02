using System.Text;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models.Chart;
using Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Helpers;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using Newtonsoft.Json;
using OxyPlot;
using OxyPlot.Axes;
using OxyPlot.Legends;
using OxyPlot.Series;
using OxyPlot.SkiaSharp;
using QuestPDF.Fluent;
using QuestPDF.Infrastructure;
using WeldingApp.Common.Extensions;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.SeamPassport;

public class WeldPassageComponent : IComponent
{
    public WeldPassageComponent(WeldPassageInstructionDto weldPassageInstruction, WeldPassageDto weldPassage)
    {
        WeldPassageInstructionInfo = weldPassageInstruction;
        WeldPassageInfo = weldPassage;
    }

    public WeldPassageInstructionDto WeldPassageInstructionInfo { get; }

    public WeldPassageDto WeldPassageInfo { get; }

    public void Compose(IContainer container)
    {
        container.Column(column =>
        {
            column.Item().PaddingTop(20);
            column.Spacing(10);

            column.Item().Element(ComposePreheatingTemperatureTable);
            column.Item().Element(ComposeWeldInfoTable);
            column.Item().Element(ComposeCharts);
        });
    }

    private void ComposePreheatingTemperatureTable(IContainer container)
    {
        container.Column(column =>
        {
            column.Spacing(2);

            column.Item().Text($"Слой №{WeldPassageInfo.Number}. {WeldPassageInfo.Name}.").Style(Typography.Bold);

            column.Item().Table(table =>
            {
                table.ColumnsDefinition(columns =>
                {
                    columns.RelativeColumn(3);
                    columns.RelativeColumn();
                    columns.RelativeColumn();
                });

                table.Header(header =>
                {
                    table.Cell()
                        .Element(BlockLeft)
                        .Text("Наименование параметра")
                        .Style(Typography.Normal);

                    table.Cell()
                        .Element(BlockLeft)
                        .Text("Значение")
                        .Style(Typography.Normal);

                    table.Cell()
                        .Element(BlockLeft)
                        .Text("Обеспечение допуска")
                        .Style(Typography.Normal);
                });

                var ensuringAccessText = GetYesOrNoByCondition(WeldPassageInfo.PreheatingTemperature <=
                                                               WeldPassageInstructionInfo.PreheatingTemperatureMax &&
                                                               WeldPassageInfo.PreheatingTemperature >=
                                                               WeldPassageInstructionInfo.PreheatingTemperatureMin);

                table.Cell()
                    .Element(BlockLeft)
                    .Text("Температура предварительного нагрева, °С")
                    .Style(Typography.Normal);

                table.Cell()
                    .Element(BlockCenter)
                    .Text(WeldPassageInfo.PreheatingTemperature.ToString())
                    .Style(Typography.Italic);

                table.Cell()
                    .Element(BlockCenter)
                    .Text(ensuringAccessText)
                    .Style(Typography.Italic);

                static IContainer BlockCenter(IContainer container) => Table.BlockCenter(container);
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
                table.Cell()
                    .Element(BlockLeft)
                    .Text("Наименование параметра")
                    .Style(Typography.Normal);

                table.Cell()
                    .ColumnSpan(2)
                    .Element(BlockCenter)
                    .Text("Значение")
                    .Style(Typography.Normal);
            });

            table.Cell()
                .Element(BlockLeft)
                .Text("Время начала сварки")
                .Style(Typography.Normal);

            table.Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text(WeldPassageInfo.WeldingStartTime.ToHoursMinutesSecondsString())
                .Style(Typography.Italic);

            var weldTimeString = TimeSpan
                .FromSeconds(WeldPassageInfo.WeldingEndTime.Subtract(WeldPassageInfo.WeldingStartTime).TotalSeconds)
                .ToMinutesSecondsString();

            table.Cell()
                .Element(BlockLeft)
                .Text("Время сварки, мин")
                .Style(Typography.Normal);

            table.Cell()
                .ColumnSpan(2)
                .Element(BlockCenter)
                .Text(weldTimeString)
                .Style(Typography.Italic);

            table.Cell()
                .RowSpan(2)
                .Element(BlockLeft)
                .Text("Суммарное время выхода параметров за пределы допустимых значений, мин")
                .Style(Typography.Normal);

            table.Cell()
                .Element(BlockCenter)
                .Text("Кратковременно, до 1 с.")
                .Style(Typography.Normal);

            table.Cell()
                .Element(BlockCenter)
                .Text("Длительно, свыше 1 с.")
                .Style(Typography.Normal);

            table.Cell()
                .Element(BlockCenter)
                .Text(CheckValueForNull(WeldPassageInfo.ShortTermDeviation))
                .Style(Typography.Italic);

            table.Cell()
                .Element(BlockCenter)
                .Text(CheckValueForNull(WeldPassageInfo.LongTermDeviation))
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

            column.Item().Text("Графики").Style(Typography.Normal);

            //var arcVoltageChartImageBytes = DownloadImage(GetArcVoltageChartImageUrl());
            var arcVoltageChartImageBytes = GetArcVoltageChartImageByte();
            column.Item().AlignCenter().Image(arcVoltageChartImageBytes);

            //column.Item().Image(arcVoltageChartImageBytes, ImageScaling.FitArea);
        });
    }

    private string CheckValueForNull<T>(T value)
    {
        return (value is not null ? value.ToString() : "-")!;
    }

    private string GetYesOrNoByCondition(bool condition)
    {
        return condition ? "Да" : "Нет";
    }

    private byte[] GetArcVoltageChartImageByte()
    {
        var model = new PlotModel
        {
            Title = $"Показания напряжения на дуге по слою №{WeldPassageInfo.Number}, В",
            DefaultFont = "Arial",
            TitleFontWeight = FontWeights.Bold,
            TitleFontSize = 22
        };

        model.Legends.Add(new Legend
        {
            LegendPlacement = LegendPlacement.Outside,
            LegendPosition = LegendPosition.TopCenter,
            LegendOrientation = LegendOrientation.Horizontal,
            LegendLineSpacing = 8,
            LegendFontSize = 15
        });

        var main = new LineSeries
        {
            Title = "Показания напряжения, В",
            Color = OxyColors.Red,
            StrokeThickness = 2,
        };

        var weldingStartTimeTemp = WeldPassageInfo.WeldingStartTime;
        var times = WeldPassageInfo.WeldingCurrentValues.Select(x =>
        {
            var time = weldingStartTimeTemp;
            weldingStartTimeTemp = weldingStartTimeTemp.Add(TimeSpan.FromSeconds(0.1));
            return time;
        }).ToArray();
        
        for (int i = 0; i < WeldPassageInfo.ArcVoltageValues.Length; i++)
        {
            main.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(times[i]), WeldPassageInfo.ArcVoltageValues[i]));
        }
        
        model.Series.Add(main);
        
        model.Axes.Add(new LinearAxis
        {
            Position = AxisPosition.Left,
            ExtraGridlines = new[] { 0.0 },
            Minimum = 0,
            Maximum = WeldPassageInfo.ArcVoltageValues.Max() + 10,
            MajorStep = 10,
            FontSize = 14
        });

        var startTime = times.First();
        var endTime = times.Last();

        var seconds = (int)Math.Round(endTime.Subtract(startTime).TotalSeconds);

        var step = seconds / (double)28;

        var minValue = TimeSpanAxis.ToDouble(startTime);
        var maxValue = TimeSpanAxis.ToDouble(endTime);
        
        model.Axes.Add(new TimeSpanAxis()
        {
            ExtraGridlines = new[] { 0.0 },
            Position = AxisPosition.Bottom,
            Minimum = minValue,
            Maximum = maxValue,
            StringFormat = "hh:mm:ss",
            MajorStep = TimeSpanAxis.ToDouble(TimeSpan.FromSeconds(step)),
            Angle = -45,
            FontSize = 14,
            StartPosition = 0.015,
        });

        if (WeldPassageInstructionInfo.ArcVoltageMax is not null &&
            WeldPassageInstructionInfo.ArcVoltageMin is not null)
        {
            var maxLine = GetStraightLine("Максимум, В", OxyColors.Blue, startTime, endTime,
                (double)WeldPassageInstructionInfo.ArcVoltageMax);
            
            var minLine = GetStraightLine("Минимум, В", OxyColors.Green, startTime, endTime,
                (double)WeldPassageInstructionInfo.ArcVoltageMin);

            model.Series.Add(maxLine);
            model.Series.Add(minLine);
        }
        
        using var stream = new MemoryStream();
        var exporterPng = new PngExporter
        {
            Width = 1300,
            Height = 700,
            Dpi = 150,
            UseTextShaping = true
        };

        exporterPng.Export(model, stream);

        var bytes = stream.ToArray();
        return bytes;
    }

    private LineSeries GetStraightLine(string title, OxyColor color, TimeSpan startTime, TimeSpan endTime, double value)
    {
        var line = new LineSeries()
        {
            Title = title,
            Color = color,
            StrokeThickness = 2,
        };

        line.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(startTime), value));
        line.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(endTime.Add(TimeSpan.FromSeconds(2))), value));

        return line;
    }
}