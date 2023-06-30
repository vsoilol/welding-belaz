namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;

public class CreateWelderCalendarBasedOnMainRequest
{
    public int Year { get; set; }

    public Guid WelderId { get; set; }
}