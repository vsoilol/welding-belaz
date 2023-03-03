namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;

public class AssignProductAccountToWeldingEquipmentsRequest
{
    public Guid ProductAccountId { get; set; }

    public List<Guid> WeldingEquipmentIds { get; set; } = null!;
}
