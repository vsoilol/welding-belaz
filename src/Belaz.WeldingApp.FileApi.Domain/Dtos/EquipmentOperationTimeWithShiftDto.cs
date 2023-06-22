namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class EquipmentOperationTimeWithShiftDto
{
    public string? CutInfo { get; set; }

    public double OnTimeMinutes { get; set; }

    public double OffTimeMinutes { get; set; }

    public double WorkTimeMinutes { get; set; }

    public double DowntimeMinutes { get; set; }
}
