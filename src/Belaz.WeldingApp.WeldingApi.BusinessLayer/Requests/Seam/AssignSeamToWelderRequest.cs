namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class AssignSeamToWelderRequest
{
    public Guid SeamId { get; set; }
    
    public Guid WelderId { get; set; }
}