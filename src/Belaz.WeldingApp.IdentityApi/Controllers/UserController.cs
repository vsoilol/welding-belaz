using Belaz.WeldingApp.IdentityApi.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IdentityApi.Controllers;

[Route("api/users")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class UserController : ControllerBase
{
    private readonly IUserManager _userManager;

    public UserController(IUserManager userManager)
    {
        _userManager = userManager;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master)]
    [ProducesResponseType(typeof(IEnumerable<UserDto>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetAll()
    {
        var users = await _userManager.GetAllAsync();

        return Ok(users);
    }

    [HttpGet("{userId}")]
    [AuthorizeRoles(Role.Admin, Role.Master)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status200OK)]
    public async Task<IActionResult> Get([FromRoute] Guid userId)
    {
        var user = await _userManager.GetByIdAsync(userId);

        return Ok(user);
    }

    [HttpPost]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status201Created)]
    public async Task<IActionResult> Add([FromBody] CreateUserRequest userContract)
    {
        var createdUserContract = await _userManager.AddAsync(userContract);

        return CreatedAtAction(
            nameof(Get),
            new { userId = createdUserContract.Id },
            createdUserContract
        );
    }

    [HttpPut("{userId}")]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status200OK)]
    public async Task<IActionResult> Update(
        [FromRoute] Guid userId,
        [FromBody] CreateUserRequest userContract
    )
    {
        var updatedUser = await _userManager.UpdateAsync(userId, userContract);

        return Ok(updatedUser);
    }

    [HttpDelete("{userId}")]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(Guid), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Delete([FromRoute] Guid userId)
    {
        var isDeleted = await _userManager.DeleteAsync(userId);

        if (isDeleted)
        {
            return Ok(userId);
        }

        return BadRequest($"During remove user process accured error, please check your request.");
    }
}
