namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;

public class GetRecordsByDatePeriodRequest
{
    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
    
    public int? SeamNumber { get; set; }
    
    public int? WeldingTaskNumber { get; set; }
    
    public Guid? WelderId { get; set; }
    
    public Guid? MasterId { get; set; }
    
    public Guid? EquipmentId { get; set; }
}