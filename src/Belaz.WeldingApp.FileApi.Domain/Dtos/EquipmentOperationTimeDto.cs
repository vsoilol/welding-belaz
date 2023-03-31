namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class EquipmentOperationTimeDto
{
    public int OnTimeMinutes { get; set; }

    public int OffTimeMinutes { get; set; }

    public int WorkTimeMinutes { get; set; }

    public int DowntimeMinutes { get; set; }
}
