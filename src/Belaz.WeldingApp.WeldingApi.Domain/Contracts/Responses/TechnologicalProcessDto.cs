namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses;

public class TechnologicalProcessDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    public string PdmSystemFileLink { get; set; } = null!;

    public List<TechnologicalInstructionDto> TechnologicalInstructions { get; set; } = null!;
}