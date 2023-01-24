namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Calendar;

public class GetByEquipmentIdRequest
{
    public Guid WeldingEquipmentId { get; set; }
    
    public int Year { get; set; }
}