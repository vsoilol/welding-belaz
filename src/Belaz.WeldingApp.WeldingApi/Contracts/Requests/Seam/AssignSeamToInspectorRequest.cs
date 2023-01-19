namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;

public class AssignSeamToInspectorRequest
{
    public Guid SeamId { get; set; }
    
    public Guid InspectorId { get; set; }
}