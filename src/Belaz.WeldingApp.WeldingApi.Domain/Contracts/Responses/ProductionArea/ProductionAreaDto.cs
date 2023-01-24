using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.ProductionArea;

public class ProductionAreaDto
{
    public Guid Id { get; set; }
    
    public string Name { get; set; }

    public int Number { get; set; }
    
    public ProductionWithNameDto Workshop { get; set; } = null!;
}