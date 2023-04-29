using Belaz.WeldingApp.IdentityApi.BusinessLayer.Models;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IdentityApi.Controllers;

[Route("api/[controller]")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class EmailController : ControllerBase
{
    private readonly IEmailSender _emailSender;

    public EmailController(IEmailSender emailSender)
    {
        _emailSender = emailSender;
    }

    [HttpPost]
    public ActionResult Get([FromQuery] string email)
    {
        var message = new Message(new string[] { email },
            "Test email",
            "This is the content from our email.");
        _emailSender.SendEmail(message);

        return Ok();
    }
}
