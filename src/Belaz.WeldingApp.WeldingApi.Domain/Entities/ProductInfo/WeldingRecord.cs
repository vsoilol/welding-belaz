﻿namespace Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;

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
    
    public WeldPassage? WeldPassage { get; set; }
}