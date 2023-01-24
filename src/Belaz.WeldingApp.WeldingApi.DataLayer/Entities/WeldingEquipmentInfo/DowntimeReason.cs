namespace Belaz.WeldingApp.WeldingApi.DataLayer.Entities.WeldingEquipmentInfo;

/// <summary>
/// Причина простоя
/// </summary>
public class DowntimeReason : Entity
{
    public string Reason { get; set; } = null!;

    public List<WeldingEquipmentConditionTime> WeldingEquipmentConditionTimes { get; set; } = null!;
}