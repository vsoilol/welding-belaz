namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.WeldingEquipment;

public class CreateWeldingEquipmentDowntime
{
    public Guid WeldingEquipmentId { get; set; }
    
    public DateTime Date { get; set; }
    
    public TimeSpan StartConditionTime { get; set; }

    /// <summary>
    /// Сколько оборудование находиться в данном состоянии в минутах
    /// </summary>
    public int Time { get; set; } = 0;
    
    /// <summary>
    /// Причина простоя
    /// </summary>
    public Guid DowntimeReasonId { get; set; }
}