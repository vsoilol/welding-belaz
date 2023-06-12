namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;

public class GetAllWorkingShiftsByWelderIdAndYearRequest
{
    public int Year { get; set; }

    public Guid WelderId { get; set; }
}