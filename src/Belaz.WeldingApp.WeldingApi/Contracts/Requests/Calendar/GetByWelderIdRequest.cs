using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;

public class GetByWelderIdRequest
{
    public Guid WelderId { get; set; }
    
    public int Year { get; set; }
}