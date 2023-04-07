using Belaz.WeldingApp.WeldingApi.Domain.Mappings;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassageInstruction;

public class
    CreateWeldPassageInstructionRequest : IMapTo<Domain.Entities.TechnologicalProcessInfo.WeldPassageInstruction>
{
    public string Name { get; set; } = null!;

    public int Number { get; set; }

    /// <summary>
    /// Сварочный ток min
    /// </summary>
    public double? WeldingCurrentMin { get; set; }

    /// <summary>
    /// Сварочный ток max
    /// </summary>
    public double? WeldingCurrentMax { get; set; }

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
    public double? PreheatingTemperatureMin { get; set; }

    /// <summary>
    /// Температура предварительного нагрева max
    /// </summary>
    public double? PreheatingTemperatureMax { get; set; }
}