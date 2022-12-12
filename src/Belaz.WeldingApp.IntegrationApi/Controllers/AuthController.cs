using System.IdentityModel.Tokens.Jwt;
using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthIntegrationApi _authIntegrationApi;

        public AuthController(IAuthIntegrationApi authIntegrationApi)
        {
            _authIntegrationApi = authIntegrationApi;
        }

        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<AuthSuccessResponse>> Register([FromBody] RegisterModelContract registerContract)
        {
            return await _authIntegrationApi.Register(registerContract);
        }

        [HttpPost("login")]
        [ProducesResponseType(typeof(AuthSuccessResponse), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<AuthSuccessResponse>> Login([FromBody] LoginModelContract loginContract)
        {

            return await _authIntegrationApi.Login(loginContract);
        }

        [HttpPost("logout")]
        public async Task<ActionResult<bool>> Logout()
        {
            return await _authIntegrationApi.Logout();
        }
    }
}
