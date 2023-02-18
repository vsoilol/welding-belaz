using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

public class WeldingTask : Entity
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Number { get; set; }
    
    public ResultProductStatus Status { get; set; }

    public string? Reason { get; set; }

    public string? DetectedDefects { get; set; }
    
    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public DateTime? WeldingDate { get; set; }

    /// <summary>
    /// Основной материал
    /// </summary>
    public string? BasicMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) основного материала
    /// </summary>
    public string? MainMaterialBatchNumber { get; set; }

    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string? WeldingMaterial { get; set; }

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string? WeldingMaterialBatchNumber { get; set; }

    /// <summary>
    /// Защитный газ 
    /// </summary>
    public string? ProtectiveGas { get; set; }

    /// <summary>
    /// № сертификата (партии) на защитный газ 
    /// </summary>
    public string? ProtectiveGasBatchNumber { get; set; }

    public Guid ManufacturedSeamId { get; set; }

    [ForeignKey(nameof(ManufacturedSeamId))] 
    public ManufacturedSeam ManufacturedSeam { get; set; } = null!;

    public Guid? WeldingEquipmentId { get; set; }

    [ForeignKey(nameof(WeldingEquipmentId))]
    public WeldingEquipment? WeldingEquipment { get; set; }

    public Guid? WelderId { get; set; }

    [ForeignKey(nameof(WelderId))] 
    public Welder? Welder { get; set; }
    
    public List<WeldPassage> WeldPassages { get; set; } = null!;
}