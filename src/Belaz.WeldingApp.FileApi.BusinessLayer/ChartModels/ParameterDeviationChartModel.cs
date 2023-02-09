namespace Belaz.WeldingApp.FileApi.BusinessLayer.ChartModels;

public class ParameterDeviationChartModel
{
    public string Parameter { get; set; } = null!;

    public decimal TimeSum { get; set; }

    public decimal TimeSumPercentages { get; set; }
}