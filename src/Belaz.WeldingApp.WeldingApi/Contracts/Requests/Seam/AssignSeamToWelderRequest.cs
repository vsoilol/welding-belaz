namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;

public class AssignSeamToWelderRequest
{
    public Guid SeamId { get; set; }
    
    public Guid WelderId { get; set; }
}