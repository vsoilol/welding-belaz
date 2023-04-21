﻿using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Enums;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;

public class WeldingEquipmentConditionTime : Entity
{
    public Condition Condition { get; set; }

    public DateTime Date { get; set; }

    public TimeSpan StartConditionTime { get; set; }

    /// <summary>
    /// Сколько оборудование находиться в данном состоянии в минутах
    /// </summary>
    public double Time { get; set; } = 0;

    public Guid WeldingEquipmentId { get; set; }

    [ForeignKey(nameof(WeldingEquipmentId))]
    public WeldingEquipment WeldingEquipment { get; set; } = null!;

     public Guid WelderId { get; set; }

    [ForeignKey(nameof(WelderId))]
    public Welder Welder { get; set; } = null!;

    public Guid? DowntimeReasonId { get; set; }

    [ForeignKey(nameof(DowntimeReasonId))]
    public DowntimeReason? DowntimeReason { get; set; }
}
