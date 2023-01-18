namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldingEquipment;

public class UpdateWeldingEquipmentDowntimeRequest
{
    public Guid Id { get; set; }
    
    public Guid WeldingEquipmentId { get; set; }
    
    /// <summary>
    /// Причина простоя
    /// </summary>
    public Guid DowntimeReasonId { get; set; }

    public string Date { get; set; } = null!;

    public string StartConditionTime { get; set; } = null!;

    /// <summary>
    /// Сколько оборудование находиться в данном состоянии в минутах
    /// </summary>
    public int Time { get; set; }
}