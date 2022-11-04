using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Controllers
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
        public async Task<ActionResult<UserContract>> Register([FromBody] RegisterModelContract registerContract)
        {
            registerContract = GetUserContract();

            var response = await _authPresenter.Register(registerContract);

            return Ok(response);
        }

        [AllowAnonymous, HttpPost("login")]
        [ProducesResponseType(typeof(LoginResponse), StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<LoginResponseContract>> Login([FromBody] LoginModelContract loginContract)
        {
            if (string.IsNullOrWhiteSpace(loginContract.Password) || string.IsNullOrWhiteSpace(loginContract.UserName))
            {
                return BadRequest("Wrong credentials!");
            }

            var response = await _authPresenter.Login(loginContract);

            return Ok(response);
        }

        [Authorize]
        [HttpPost("logout")]
        public async Task<ActionResult<UserContract>> Logout()
        {
            var response = await _authPresenter.Logout();

            return Ok(response);
        }

        private RegisterModelContract GetUserContract()
        {
            return new RegisterModelContract
            {
                FirstName = "admin",
                LastName = "admin",
                MiddleName = "admin",
                Email = "admin",
                UserName = "admin",
                Role = "Master",
                Password = "admin",
                ConfirmPassword = "admin"
            };
        }
    }
}
