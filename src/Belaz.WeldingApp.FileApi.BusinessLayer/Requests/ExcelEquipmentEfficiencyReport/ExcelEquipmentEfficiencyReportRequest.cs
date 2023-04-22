namespace Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportRequest
{
    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;

    /// <summary>
    /// Доступность
    /// </summary>
    public double? Accessibility { get; set; }

    /// <summary>
    /// Производительность
    /// </summary>
    public double? Efficiency { get; set; }

    /// <summary>
    /// Качество
    /// </summary>
    public double? Quality { get; set; }
}
