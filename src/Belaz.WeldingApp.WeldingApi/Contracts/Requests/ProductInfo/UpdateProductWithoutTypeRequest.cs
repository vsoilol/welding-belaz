using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;

public class UpdateProductWithoutTypeRequest
{
    public Guid Id { get; set; }
    
    public string? Name { get; set; }
        
    public int Number { get; set; }

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }
    
    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }

    public List<UpdateSeamRequest> Seams { get; set; } = null!;
    
    public List<UpdateProductRequest>? InsideProducts { get; set; }
}