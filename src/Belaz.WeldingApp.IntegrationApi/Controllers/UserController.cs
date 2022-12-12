using Belaz.WeldingApp.IntegrationApi.Presenters.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IntegrationApi.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserPresenter _userPresenter;

        public UserController(IUserPresenter userPresenter)
        {
            _userPresenter = userPresenter;
        }


        [Authorize(Roles = "Admin"), HttpGet()]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Get()
        {
            var users = await _userPresenter.GetUsers();

            return Ok(users);
        }

        [Authorize(Roles = "Master"), HttpGet("userId")]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Get(int userId)
        {
            return Ok(1);
        }
    }
}
