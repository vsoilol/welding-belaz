using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.Common.Entities.ProductInfo;

public class ProductAccountTask : Entity
{
    public string SequenceNumbers { get; set; } = null!;
    
    public DateTime DateFromPlan { get; set; }
    
    public DateTime? EndDateFromPlan { get; set; }
    
    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }

    public int ManufacturedAmount { get; set; } = 0;
    
    public int AcceptedAmount { get; set; } = 0;
    
    public int DefectiveAmount { get; set; } = 0;
    
    public Guid ProductAccountId { get; set; }

    [ForeignKey(nameof(ProductAccountId))]
    public ProductAccount ProductAccount { get; set; } = null!;

    public List<WeldingTask> WeldingTasks { get; set; } = null!;
    
    public List<WeldingEquipment> WeldingEquipments { get; set; } = null!;

    public Guid? MasterId { get; set; }

    [ForeignKey(nameof(MasterId))]
    public Master? Master { get; set; }

    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))]
    public Inspector? Inspector { get; set; }
}