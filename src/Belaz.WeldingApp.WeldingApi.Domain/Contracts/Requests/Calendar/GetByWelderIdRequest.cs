namespace Belaz.WeldingApp.WeldingApi.Domain.Contracts.Contracts.Requests.Calendar;

public class GetByWelderIdRequest
{
    public Guid WelderId { get; set; }
    
    public int Year { get; set; }
}