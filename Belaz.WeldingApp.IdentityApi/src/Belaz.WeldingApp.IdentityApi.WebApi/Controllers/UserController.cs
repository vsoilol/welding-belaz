using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Controllers
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

        [Authorize, HttpGet]
        [ProducesResponseType(typeof(IEnumerable<UserContract>), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAll()
        {
            var users = await _userPresenter.GetAllAsync();

            return Ok(users);
        }

        [Authorize, HttpGet("userId")]
        [ProducesResponseType(typeof(UserContract), StatusCodes.Status200OK)]
        public async Task<IActionResult> Get(int userId)
        {
            var user = await _userPresenter.GetByIdAsync(userId);

            return Ok(user);
        }

        [Authorize, HttpPost]
        [ProducesResponseType(typeof(UserContract), StatusCodes.Status201Created)]
        public async Task<IActionResult> Add([FromBody] UserContract userContract)
        {
            var createdUserContract = await _userPresenter.AddAsync(userContract);

            return CreatedAtAction(nameof(Get), new { id = createdUserContract.Id }, createdUserContract);
        }

        [Authorize, HttpPut("userId")]
        [ProducesResponseType(typeof(UserContract), StatusCodes.Status200OK)]
        public async Task<IActionResult> Update(int userId, [FromBody] UserContract userContract)
        {
            var updatedUser = await _userPresenter.UpdateAsync(userId, userContract);

            return Ok(updatedUser);
        }


        [Authorize, HttpDelete("userId")]
        [ProducesResponseType(typeof(int), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Delete(int userId)
        {
            var isDeleted = await _userPresenter.DeleteAsync(userId);

            if (isDeleted)
            {
                return Ok(userId);
            }

            return BadRequest($"During remove user process accured error, please check your request.");
        }
    }
}
