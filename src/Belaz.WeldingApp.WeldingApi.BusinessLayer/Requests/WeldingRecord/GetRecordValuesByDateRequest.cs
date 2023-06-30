namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;

public class GetRecordValuesByDateRequest
{
    public string Date { get; set; } = null!;

    public string? StartTime { get; set; }
    
    public string? EndTime { get; set; }

    public Guid? WelderId { get; set; }
    
    public Guid? EquipmentId { get; set; }
}