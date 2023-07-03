using OxyPlot;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Models;

public class WeldPassageLineInfo
{
    public double? Min { get; set; }
    
    public double? Max { get; set; }

    public int WeldPassageNumber { get; set; }

    public OxyColor MinColor { get; set; }
    
    public OxyColor MaxColor { get; set; }

    public static OxyColor[] Colors = new OxyColor[]
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
}