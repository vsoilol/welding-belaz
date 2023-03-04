using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

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
    public double? PreheatingTemperature { get; set; }

    /// <summary>
    /// Отклонение кратковременные, до 1 секунды
    /// </summary>
    public double? ShortTermDeviation { get; set; }

    /// <summary>
    /// Отклонения длительные, более 1 секунды
    /// </summary>
    public double? LongTermDeviation { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для тока. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringCurrentAllowance { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для напряжения. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringVoltageAllowance { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для температуры. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringTemperatureAllowance { get; set; }

    public Guid WeldingRecordId { get; set; }

    [ForeignKey(nameof(WeldingRecordId))]
    public WeldingRecord WeldingRecord { get; set; } = null!;

    public Guid WeldingTaskId { get; set; }

    [ForeignKey(nameof(WeldingTaskId))]
    public WeldingTask WeldingTask { get; set; } = null!;
}
