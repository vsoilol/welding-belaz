using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.Presenters.Interfaces;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using BadRequestResult = WeldingApp.Common.Models.BadRequestResult;

namespace Belaz.WeldingApp.IdentityApi.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthPresenter _authPresenter;

        public AuthController(IAuthPresenter authPresenter)
        {
            _authPresenter = authPresenter;
        }

        [AllowAnonymous, HttpPost("register")]
        [ProducesResponseType(typeof(LoginResponse), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Register([FromBody] RegisterModelContract registerContract)
        {
            var authResponse = await _authPresenter.Register(registerContract);

            var authSuccess = new AuthSuccessResponse
            {
                Token = authResponse.Token,
                UserId = authResponse.UserId,
                ExpirationDate = authResponse.ExpirationDate
            };
            return Ok(authSuccess);
        }

        [AllowAnonymous, HttpPost("login")]
        [ProducesResponseType(typeof(LoginResponse), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Login([FromBody] LoginModelContract loginContract)
        {
            var authResponse = await _authPresenter.Login(loginContract);

            var authSuccess = new AuthSuccessResponse
            {
                Token = authResponse.Token,
                UserId = authResponse.UserId,
                ExpirationDate = authResponse.ExpirationDate
            };
            return Ok(authSuccess);
        }

        [Authorize]
        [HttpPost("logout")]
        public async Task<ActionResult<bool>> Logout()
        {
            var response = await _authPresenter.Logout();

            return response;
        }
    }
}
