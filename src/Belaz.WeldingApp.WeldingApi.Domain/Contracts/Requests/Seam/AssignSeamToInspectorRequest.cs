namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Requests.Seam;

public class AssignSeamToInspectorRequest
{
    public Guid SeamId { get; set; }
    
    public Guid InspectorId { get; set; }
}