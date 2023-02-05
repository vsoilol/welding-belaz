namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class AssignSeamsToInspectorRequest
{
    public List<Guid> SeamIds { get; set; } = null!;

    public Guid InspectorId { get; set; }
}