using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using OxyPlot;
using OxyPlot.Axes;
using OxyPlot.Legends;
using OxyPlot.Series;
using OxyPlot.SkiaSharp;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.ChartsGenerators;

public static class ChartGenerator
{
    public static byte[] GetArcVoltageChartImageByte(
        WeldPassageDto weldPassageInfo,
        string measurementUnit,
        string title,
        string mainPlotTitle,
        double[] values,
        double? min,
        double? max
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

        var weldingStartTimeTemp = weldPassageInfo.WeldingStartTime;
        var times = values
            .Select(x =>
            {
                var time = weldingStartTimeTemp;
                weldingStartTimeTemp = weldingStartTimeTemp.Add(TimeSpan.FromSeconds(0.1));
                return time;
            })
            .ToArray();

        var startTime = times.First();
        var endTime = times.Last();

        //var seconds = (int)Math.Round(endTime.Subtract(startTime).TotalSeconds);

        var minValueTime = TimeSpanAxis.ToDouble(startTime);
        var maxValueTime = TimeSpanAxis.ToDouble(endTime.Add(TimeSpan.FromSeconds(1)));

        var step = Math.Round((maxValueTime - minValueTime) / (double) 28, 2);

        if (max is not null && min is not null)
        {
            var maxLine = GetStraightLine(
                $"Максимум, {measurementUnit}",
                OxyColors.Blue,
                startTime,
                endTime,
                (double) max
            );

            var minLine = GetStraightLine(
                $"Минимум, {measurementUnit}",
                OxyColors.Green,
                startTime,
                endTime,
                (double) min
            );

            model.Series.Add(maxLine);
            model.Series.Add(minLine);
        }

        for (int i = 0; i < values.Length; i++)
        {
            main.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(times[i]), values[i]));
        }

        model.Series.Add(main);

        var minValue = values.Min();
        var maximumAxes =
            (values.Max() + 10 < max) && max is not null ? (double) max + 10 : values.Max() + 10;

        var minimumAxes = min < minValue && min is not null ? (double) min - 10 : minValue - 10;

        var valuesDifference = maximumAxes - minimumAxes;
        var leftAxesStep = 10;

        if (valuesDifference / 10 > 15)
        {
            leftAxesStep = (int) (valuesDifference / 15);
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
                ExtraGridlines = new[] {0.0},
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

    private static LineSeries GetStraightLine(
        string title,
        OxyColor color,
        TimeSpan startTime,
        TimeSpan endTime,
        double value
    )
    {
        var line = new LineSeries()
        {
            Title = title,
            Color = color,
            StrokeThickness = 2,
        };

        line.Points.Add(new DataPoint(TimeSpanAxis.ToDouble(startTime), value));
        line.Points.Add(
            new DataPoint(TimeSpanAxis.ToDouble(endTime.Add(TimeSpan.FromSeconds(2))), value)
        );

        return line;
    }
}