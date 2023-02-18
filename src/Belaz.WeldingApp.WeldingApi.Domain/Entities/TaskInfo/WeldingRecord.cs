using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;

public class WeldingRecord : Entity
{
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
    
    /// <summary>
    /// Значения сварочного тока
    /// </summary>
    public double[] WeldingCurrentValues { get; set; } = null!;

    /// <summary>
    /// Значения напряжения на дуге
    /// </summary>
    public double[] ArcVoltageValues { get; set; } = null!;
    
    public Guid WeldingEquipmentId { get; set; }

    [ForeignKey(nameof(WeldingEquipmentId))]
    public WeldingEquipment WeldingEquipment { get; set; } = null!;
    
    public Guid WelderId { get; set; }

    [ForeignKey(nameof(WelderId))]
    public Welder Welder { get; set; } = null!;
    
    public Guid MasterId { get; set; }

    [ForeignKey(nameof(MasterId))]
    public Master Master { get; set; } = null!;
    
    public WeldPassage? WeldPassage { get; set; }
}