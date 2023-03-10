using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

public class WeldingTask : Entity
{
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Number { get; set; }

    public SeamStatus Status { get; set; } = SeamStatus.Accept;

    public WeldingTaskStatus TaskStatus { get; set; } = WeldingTaskStatus.NotStarted;

    public DefectiveReason? DefectiveReason { get; set; }

    /// <summary>
    /// Добавлен ли вручную
    /// </summary>
    public bool IsAddManually { get; set; } = false;

    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public DateTime WeldingDate { get; set; }

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

    public Guid SeamAccountId { get; set; }

    [ForeignKey(nameof(SeamAccountId))]
    public SeamAccount SeamAccount { get; set; } = null!;

    public Guid? WelderId { get; set; }

    [ForeignKey(nameof(WelderId))]
    public Welder? Welder { get; set; } = null!;

    public Guid MasterId { get; set; }

    [ForeignKey(nameof(MasterId))]
    public Master Master { get; set; } = null!;

    public Guid? InspectorId { get; set; }

    [ForeignKey(nameof(InspectorId))]
    public Inspector? Inspector { get; set; } = null!;

    public List<WeldPassage> WeldPassages { get; set; } = null!;
}
