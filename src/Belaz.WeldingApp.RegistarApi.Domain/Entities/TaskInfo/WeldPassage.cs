using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;

/// <summary>
/// Проход для сварного шва
/// </summary>
public class WeldPassage : Entity
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    /// <summary>
    /// Температура предварительного нагрева
    /// </summary>
    public int? PreheatingTemperature { get; set; }

    /// <summary>
    /// Отклонение кратковременные, до 1 секунды
    /// </summary>
    public double? ShortTermDeviation { get; set; }

    /// <summary>
    /// Отклонения длительные, более 1 секунды
    /// </summary>
    public double? LongTermDeviation { get; set; }

    public bool? IsEnsuringCurrentTolerance { get; set; }

    public bool? IsEnsuringVoltageTolerance { get; set; }

    public bool? IsEnsuringTemperatureTolerance { get; set; }

    public Guid WeldingRecordId { get; set; }

    [ForeignKey(nameof(WeldingRecordId))]
    public WeldingRecord WeldingRecord { get; set; } = null!;

    public Guid WeldingTaskId { get; set; }

    [ForeignKey(nameof(WeldingTaskId))]
    public WeldingTask WeldingTask { get; set; } = null!;
}
