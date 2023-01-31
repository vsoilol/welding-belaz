using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

/// <summary>
/// Проход для сварного шва
/// </summary>
public class WeldPassage : Entity
{
    public int Number { get; set; }

    public string Name { get; set; } = null!;

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double WeldingCurrentMax { get; set; }

    /// <summary>
    /// Напряжения на дуге min
    /// </summary>
    public double? ArcVoltageMin { get; set; }

    /// <summary>
    /// Напряжения на дуге max
    /// </summary>
    public double? ArcVoltageMax { get; set; }

    /// <summary>
    /// Температура предварительного нагрева min
    /// </summary>
    public double PreheatingTemperatureMin { get; set; }

    /// <summary>
    /// Температура предварительного нагрева max
    /// </summary>
    public double PreheatingTemperatureMax { get; set; }

    /// <summary>
    /// Выполнен ли без нарушения требований технологической инструкции
    /// </summary>
    public bool IsDone { get; set; } = false;

    public Guid SeamId { get; set; }

    [ForeignKey(nameof(SeamId))] public Seam Seam { get; set; } = null!;

    public Guid? WeldPassageResultId { get; set; }

    [ForeignKey(nameof(WeldPassageResultId))]
    public WeldPassageResult? WeldPassageResult { get; set; }
}