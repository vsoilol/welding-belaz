namespace Belaz.WeldingApp.FileApi.BusinessLayer.Models;

public class ParametersResult
{
    public double Min { get; set; }

    public double Max { get; set; }

    public double Average { get; set; }

    public string EnsuringAccess { get; set; } = null!;
}