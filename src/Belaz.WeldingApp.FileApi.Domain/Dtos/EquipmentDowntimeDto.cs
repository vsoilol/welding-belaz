namespace Belaz.WeldingApp.FileApi.Domain.Dtos;

public class EquipmentDowntimeDto
{
    public string Reason { get; set; } = null!;

    public int Time { get; set; } = 0;
}
