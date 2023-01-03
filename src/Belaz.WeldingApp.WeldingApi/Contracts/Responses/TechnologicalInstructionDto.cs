using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class TechnologicalInstructionDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public SeamDto Seam { get; set; } = null!;
    
    public List<WeldPassageDto> WeldPassages { get; set; } = null!;
}