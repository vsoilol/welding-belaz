namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;

public class AssignEquipmentsToMastersRequest
{
    public List<Guid> WeldingEquipmentIds { get; set; } = null!;

    public List<Guid> MasterIds { get; set; } = null!;
}