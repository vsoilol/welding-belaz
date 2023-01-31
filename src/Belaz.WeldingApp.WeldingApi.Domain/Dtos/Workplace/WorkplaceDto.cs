using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Post;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;

public class WorkplaceDto : IMapFrom<Entities.Production.Workplace>
{
    public Guid Id { get; set; }
    
    public string? IdFromSystem { get; set; }
    
    public int Number { get; set; }
        
    public PostBriefDto? Post { get; set; }

    public ProductionAreaBriefDto? ProductionArea { get; set; }
}