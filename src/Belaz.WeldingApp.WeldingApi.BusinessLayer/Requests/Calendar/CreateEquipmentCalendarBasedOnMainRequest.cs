namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class CreateEquipmentCalendarBasedOnMainRequest
{
    public int Year { get; set; }

    public Guid EquipmentId { get; set; }
}