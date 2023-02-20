﻿using System.ComponentModel.DataAnnotations.Schema;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.Users;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.WeldingEquipmentInfo;

namespace Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;

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
}