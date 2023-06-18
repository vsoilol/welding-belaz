namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;

public class GetRecordsByDatePeriodRequest
{
    public string StartDate { get; set; } = null!;

    public string EndDate { get; set; } = null!;
}