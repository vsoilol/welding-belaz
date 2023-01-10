namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class ProductionBriefDto
{
    public Guid Id { get; set; }

    public int Number { get; set; }
    
    public string? Name { get; set; }
}