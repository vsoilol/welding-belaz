namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class WeldingDeviationValues
{
    public TimeSpan DeviationStart { get; set; }
    
    public TimeSpan DeviationEnd { get; set; }

    public double[] Values { get; set; } = null!;

    public double[] DeviationValues { get; set; } = null!;

    public double MaxInstruction { get; set; }
    
    public double MinInstruction { get; set; }
}