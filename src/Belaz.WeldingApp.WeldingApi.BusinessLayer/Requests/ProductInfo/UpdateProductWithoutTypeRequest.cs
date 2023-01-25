namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductInfo;

public class UpdateProductWithoutTypeRequest
{
    public Guid Id { get; set; }
    
    public string? Name { get; set; }
        
    public int? Number { get; set; }

    /// <summary>
    /// Подлежит ли контролю
    /// </summary>
    public bool? IsControlSubject { get; set; }
    
    public Guid? ProductionAreaId { get; set; }

    public Guid? WorkplaceId { get; set; }
    
    public Guid? TechnologicalProcessId { get; set; }

    public IReadOnlyList<Guid>? Seams { get; set; }
    
    public IReadOnlyList<Guid>? InsideProducts { get; set; }
}