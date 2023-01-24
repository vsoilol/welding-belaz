namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Responses.WeldingTask;

public class WeldingTaskRegistrarInfoDto
{
    /// <summary>
    /// Температура окружающей среды
    /// </summary>
    public int AmbientTemperature { get; set; }

    /// <summary>
    /// Влажность воздуха
    /// </summary>
    public int AirHumidity { get; set; }
        
    /// <summary>
    /// Межслойная температура
    /// </summary>
    public int InterlayerTemperature { get; set; }

    /// <summary>
    /// Номер текущего слоя
    /// </summary>
    public int CurrentLayerNumber { get; set; }

    /// <summary>
    /// Температура предварительного нагрева
    /// </summary>
    public int PreheatingTemperature { get; set; }
    
    /// <summary>
    /// Значения сварочного тока
    /// </summary>
    public double[]? WeldingCurrentValues { get; set; }
        
    /// <summary>
    /// Значения напряжения на дуге
    /// </summary>
    public double[]? ArcVoltageValues { get; set; }
}