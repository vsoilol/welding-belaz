using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.Common.Entities.TaskInfo;

public class WeldingRecord : Entity
{
    public DateTime Date { get; set; }

    /// <summary>
    /// Время начала сварки
    /// </summary>
    public TimeSpan WeldingStartTime { get; set; }

    /// <summary>
    /// Время окончания сварки
    /// </summary>
    public TimeSpan WeldingEndTime { get; set; }

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

    public Guid? MasterId { get; set; }

    [ForeignKey(nameof(MasterId))]
    public Master? Master { get; set; }

    public WeldPassage? WeldPassage { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для тока. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringCurrentAllowance { get; set; }

    /// <summary>
    /// Обеспечивает ли допуск для напряжения. True - обеспечивает, false - не обеспечивает
    /// </summary>
    public bool? IsEnsuringVoltageAllowance { get; set; }

    public double WeldingCurrentAverage { get; set; }
    
    public double ArcVoltageAverage { get; set; }
    
    public int? SequenceNumber { get; set; }
    
    public Guid WeldingRecordLimitId { get; set; }

    [ForeignKey(nameof(WeldingRecordLimitId))]
    public WeldingRecordLimit WeldingRecordLimit { get; set; } = null!;
}
