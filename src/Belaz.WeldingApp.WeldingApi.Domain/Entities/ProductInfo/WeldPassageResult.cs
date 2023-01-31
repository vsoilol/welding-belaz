namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

public class WeldPassageResult : Entity
{
    /// <summary>
    /// Значения сварочного тока
    /// </summary>
    public double[] WeldingCurrentValues { get; set; } = null!;

    /// <summary>
    /// Значения напряжения на дуге
    /// </summary>
    public double[] ArcVoltageValues { get; set; } = null!;

    /// <summary>
    /// Отклонение кратковременные, до 1 секунды
    /// </summary>
    public double? ShortTermDeviation { get; set; }

    /// <summary>
    /// Отклонения длительные, более 1 секунды
    /// </summary>
    public double? LongTermDeviation { get; set; }

    /// <summary>
    /// Время начала сварки
    /// </summary>
    public TimeSpan WeldingStartTime { get; set; }

    /// <summary>
    /// Время окончания сварки
    /// </summary>
    public TimeSpan WeldingEndTime { get; set; }

    /// <summary>
    /// Температура предварительного нагрева
    /// </summary>
    public int PreheatingTemperature { get; set; }

    public List<WeldPassage> WeldPassages { get; set; } = null!;
}