using OxyPlot;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Models;

public class WeldPassageLineInfo
{
    public static readonly OxyColor[] Colors =
    {
        OxyColors.Blue,
        OxyColors.Green,
        OxyColors.Purple,
        OxyColors.Orange,
        OxyColors.Brown,
        OxyColors.LightGreen,
        OxyColors.DarkRed,
        OxyColors.DarkBlue,
        OxyColors.Magenta,
        OxyColors.DarkOrange,
    };

    public double? Min { get; }

    public double? Max { get; }

    public int WeldPassageNumber { get; }

    public OxyColor MinColor { get; }

    public OxyColor MaxColor { get; }

    public TimeSpan StartTime { get; }

    public TimeSpan EndTime { get; }

    public WeldPassageLineInfo(int weldPassageNumber, double? min, double? max, TimeSpan startTime, TimeSpan endTime)
    {
        WeldPassageNumber = weldPassageNumber;
        Min = min;
        Max = max;
        StartTime = startTime;
        EndTime = endTime;
        MinColor = Colors[(weldPassageNumber - 1) * 2];
        MaxColor = Colors[(weldPassageNumber - 1) * 2 + 1];
    }
}