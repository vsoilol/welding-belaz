namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class EquipmentOperationTimeWithShiftDto
{
    public int WorkingShifNumber { get; set; }

    public int OnTimeMinutes { get; set; }

    public int OffTimeMinutes { get; set; }

    public int WorkTimeMinutes { get; set; }

    public int DowntimeMinutes { get; set; }
}
