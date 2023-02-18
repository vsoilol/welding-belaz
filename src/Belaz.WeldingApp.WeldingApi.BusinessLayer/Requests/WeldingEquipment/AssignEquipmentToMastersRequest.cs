namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;

public class AssignEquipmentToMastersRequest
{
    public Guid WeldingEquipmentId { get; set; }

    public List<Guid> MasterIds { get; set; } = null!;
}