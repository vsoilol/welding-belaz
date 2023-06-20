﻿using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Mappings;

namespace Belaz.WeldingApp.RegistarApi.Domain.Dtos;

public class WeldingRecordLimitDto : IMapFrom<WeldingRecordLimit>
{
    public Guid Id { get; set; }
    
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
}