using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.Domain.Mappings;

namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class TaskDto : IMapFrom<WeldingTask>
{
    public int Number { get; set; }

    /// <summary>
    /// Дата выполнения сварки
    /// </summary>
    public string WeldingDate { get; set; } = null!;

    public SeamDto Seam { get; set; } = null!;

    public UserBriefDto Master { get; set; } = null!;

    public UserBriefDto Welder { get; set; } = null!;

    public UserBriefDto Inspector { get; set; } = null!;

    public WeldingEquipmentBriefDto WeldingEquipment { get; set; } = null!;

    /// <summary>
    /// Основной материал
    /// </summary>
    public string BasicMaterial { get; set; } = null!;

    /// <summary>
    /// № сертификата (партии) основного материала
    /// </summary>
    public string MainMaterialBatchNumber { get; set; } = null!;

    /// <summary>
    /// Сварочные материалы
    /// </summary>
    public string WeldingMaterial { get; set; } = null!;

    /// <summary>
    /// № сертификата (партии) св. материала
    /// </summary>
    public string WeldingMaterialBatchNumber { get; set; } = null!;

    /// <summary>
    /// Защитный газ 
    /// </summary>
    public string? ProtectiveGas { get; set; }

    /// <summary>
    /// № сертификата (партии) на защитный газ 
    /// </summary>
    public string? ProtectiveGasBatchNumber { get; set; }
}