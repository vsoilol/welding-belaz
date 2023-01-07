using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Seam;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;

public class CreateProductRequest
{
    public string? Name { get; set; }
        
    public int Number { get; set; }
    
    public ProductType ProductType { get; set; }
    
    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool IsControlSubject { get; set; }
    
    public Guid ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }

    public List<CreateSeamRequest> Seams { get; set; } = null!;
    
    public List<CreateProductRequest>? InsideProducts { get; set; }
}