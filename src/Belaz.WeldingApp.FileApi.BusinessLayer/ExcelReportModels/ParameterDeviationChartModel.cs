namespace Belaz.WeldingApp.FileApi.BusinessLayer.ExcelReportModels;

public class ParameterDeviationReportModel
{
    public string Parameter { get; set; } = null!;

    public double TimeSum { get; set; }

    public double TimeSumPercentages { get; set; }
}
