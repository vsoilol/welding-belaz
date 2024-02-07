namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;

public class AssignProductAccountTaskToWeldingEquipmentsRequest
{
    public Guid ProductAccountTaskId { get; set; }

    public List<Guid> WeldingEquipmentIds { get; set; } = null!;
}
