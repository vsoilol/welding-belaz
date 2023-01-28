namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class AssignSeamToInspectorRequest
{
    public Guid SeamId { get; set; }
    
    public Guid InspectorId { get; set; }
}