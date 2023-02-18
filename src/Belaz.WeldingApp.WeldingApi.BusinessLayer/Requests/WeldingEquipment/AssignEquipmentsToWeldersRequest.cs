namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;

public class AssignEquipmentsToWeldersRequest
{
    public List<Guid> WeldingEquipmentIds { get; set; } = null!;

    public List<Guid> WelderIds { get; set; } = null!;
}