namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses.ProductionArea;

public class ProductionAreaDto
{
    public Guid Id { get; set; }
    
    public string Name { get; set; }

    public int Number { get; set; }
    
    public ProductionBriefDto Workshop { get; set; } = null!;
}