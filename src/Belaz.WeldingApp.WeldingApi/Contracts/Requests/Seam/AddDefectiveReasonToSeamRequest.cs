namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;

public class AddDefectiveReasonToSeamRequest
{
    public Guid SeamId { get; set; }
    
    public string Date { get; set; } = null!;

    public string Reason { get; set; } = null!;
}