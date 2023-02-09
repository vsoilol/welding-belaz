using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;

public class CreateSeamRequest : IMapTo<Domain.Entities.ProductInfo.Seam>
{
    public int Number { get; set; }
    
    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }
    
    public int Length { get; set; }
    
    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }
    
    public Guid? TechnologicalInstructionId { get; set; }
}