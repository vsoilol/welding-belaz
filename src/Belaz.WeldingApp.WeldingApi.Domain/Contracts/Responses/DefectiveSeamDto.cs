namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses;

public class DefectiveSeamDto
{
    public Guid Id { get; set; }
    
    public SeamDto Seam { get; set; } = null!;

    public string Date { get; set; } = null!;

    public string Reason { get; set; } = null!;
}