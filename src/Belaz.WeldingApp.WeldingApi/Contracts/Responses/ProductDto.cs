using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Responses;

public class ProductDto
{
    public string? Name { get; set; }
        
    public int Number { get; set; }

    public int? WorkplaceNumber { get; set; }
    
    public int ProductionAreaNumber { get; set; }
    
    public int WorkshopNumber { get; set; }
    
    public TechnologicalProcessBriefDto TechnologicalProcess { get; set; } = null!;

    public List<ProductBriefDto> InsideProducts { get; set; } = null!;
    
    public List<SeamBriefDto> Seams { get; set; } = null!;
}