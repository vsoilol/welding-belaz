using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.WeldingApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class TimeController : ControllerBase
{
    [HttpGet("belarus")]
    [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]
    public ActionResult<string> GetBelarusTimeAsync()
    {
        var dt = DateTime.Now;
        var minskTime = TimeZoneInfo
            .ConvertTimeBySystemTimeZoneId(dt, TimeZoneInfo.Local.Id, "Belarus Standard Time");

        return minskTime.ToString("f");
    }
    
    [HttpGet("now")]
    [ProducesResponseType(typeof(string), StatusCodes.Status200OK)]
    public ActionResult<string> GetNowTimeAsync()
    {
        var dt = DateTime.Now;
        return dt.ToString("f");
    }
}