namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class AssignSeamsToWelderRequest
{
    public List<Guid> SeamIds { get; set; } = null!;

    public Guid WelderId { get; set; }
}