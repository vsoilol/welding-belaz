namespace Belaz.WeldingApp.FileApi.BusinessLayer.Templates.Models;

public class Values
{
    public WeldingValue[] WeldingCurrentValues { get; set; } = null!;
    
    public WeldingValue[] ArcVoltageValues { get; set; } = null!;
}

public struct WeldingValue
{
    public WeldingValue(double value, int? weldPassageNumber = null)
    {
        Value = value;
        WeldPassageNumber = weldPassageNumber;
    }

    public double Value { get; }

    public int? WeldPassageNumber { get; }
}