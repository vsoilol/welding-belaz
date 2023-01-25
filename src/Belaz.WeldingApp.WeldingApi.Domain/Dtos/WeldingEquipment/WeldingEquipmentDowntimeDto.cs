namespace Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;

/// <summary>
/// Простои оборудования
/// </summary>
public class WeldingEquipmentDowntimeDto
{
    public Guid Id { get; set; }
    
    public WeldingEquipmentBriefDto WeldingEquipment { get; set; }  = null!;

    /// <summary>
    /// Причина простоя
    /// </summary>
    public string DowntimeReason { get; set; } = null!;

    public string Date { get; set; }  = null!;
    
    public string StartConditionTime { get; set; }  = null!;
    
    public int Time { get; set; }
}
