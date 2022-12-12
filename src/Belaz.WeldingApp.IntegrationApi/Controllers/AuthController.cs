using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        public AuthController()
        {
        }

        [Authorize, HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult Register()
        {
            return Ok(1);
        }
    }
}
