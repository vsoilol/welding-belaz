using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

public class ProductTaskDto
{
    public Guid ProductAccountId { get; set; }
    
    public int PlannedQuantity  { get; set; }
    
    public int TaskNumber { get; set; }

    public bool IsComplete { get; set; } = false;

    public string SequenceNumbers { get; set; } = null!;

    public ProductBriefDto Product { get; set; } = null!;

    public ProductBriefDto? Knot { get; set; }

    public ProductBriefDto? Detail { get; set; }

    public string PlannedStartDate { get; set; } = null!;

    public string? PlannedEndDate { get; set; }

    public List<string> SeamNumbers { get; set; } = null!;

    public List<WeldingEquipmentBriefDto> WeldingEquipments { get; set; } = null!;

    public int ManufacturedAmount { get; set; }

    public int AcceptedAmount { get; set; }

    public int DefectiveAmount { get; set; }
    
    public string? DefectiveReason { get; set; }

    /// <summary>
    /// Есть ли отклонения
    /// </summary>
    public bool HasDeviations { get; set; } = false;
}