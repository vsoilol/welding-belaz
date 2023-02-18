namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;

public class AssignEquipmentToWeldersRequest
{
    public Guid WeldingEquipmentId { get; set; }

    public List<Guid> WelderIds { get; set; } = null!;
}