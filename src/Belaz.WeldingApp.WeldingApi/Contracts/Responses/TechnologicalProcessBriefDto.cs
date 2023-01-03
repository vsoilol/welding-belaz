namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class TechnologicalProcessBriefDto
{
    public Guid Id { get; set; }
    
    public string Name { get; set; } = null!;
    
    public int Number { get; set; }
}