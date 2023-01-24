using Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Production;

namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.Workplace;

public class WorkplaceDto
{
    public Guid Id { get; set; }
    
    public int Number { get; set; }
        
    public ProductionWithNameDto? Post { get; set; }

    public ProductionWithNameDto? ProductionArea { get; set; }
}