namespace Belaz.WeldingApp.IntegrationApi.Contracts.Responses.WeldingEquipment;

/// <summary>
/// Простои оборудования
/// </summary>
public class WeldingEquipmentDowntimeDto
{
    public WeldingEquipmentBriefDto WeldingEquipment { get; set; }

    /// <summary>
    /// Причина простоя
    /// </summary>
    public string DowntimeReason { get; set; }

    /// <summary>
    /// Время изменения состояния
    /// </summary>
    public string ChangeConditionTime { get; set; }
}
