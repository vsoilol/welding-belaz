namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;

public class GetByEquipmentIdRequest
{
    public Guid WeldingEquipmentId { get; set; }
    
    public int Year { get; set; }
}