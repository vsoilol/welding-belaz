using Belaz.WeldingApp.IdentityApi.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.Contracts;

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

        HttpContext.Items[ContextItems.LogMessage] = "Получение информации о всех пользователях";

        return Ok(users);
    }

    [HttpGet("{userId}")]
    [AuthorizeRoles(Role.Admin, Role.Master)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status200OK)]
    public async Task<IActionResult> Get([FromRoute] Guid userId)
    {
        var user = await _userManager.GetByIdAsync(userId);

        HttpContext.Items[ContextItems.LogMessage] =
            $"Получение информации о пользователе: {user.MiddleName} {user.FirstName} {user.LastName}";

        return Ok(user);
    }

    [HttpPost]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status201Created)]
    public async Task<IActionResult> Add([FromBody] CreateUserRequest userContract)
    {
        var createdUserContract = await _userManager.AddAsync(userContract);

        HttpContext.Items[ContextItems.LogMessage] =
            $"Добавление нового пользователя: {createdUserContract.MiddleName} {createdUserContract.FirstName} {createdUserContract.LastName}";

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

        HttpContext.Items[ContextItems.LogMessage] =
            $"Обновление информации о пользователе: {updatedUser.MiddleName} {updatedUser.FirstName} {updatedUser.LastName}";

        return Ok(updatedUser);
    }

    [HttpDelete("{userId}")]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(Guid), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Delete([FromRoute] Guid userId)
    {
        var user = await _userManager.GetByIdAsync(userId);
        var isDeleted = await _userManager.DeleteAsync(userId);

        if (isDeleted)
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Удаление пользователя: {user.MiddleName} {user.FirstName} {user.LastName}";
            return Ok(userId);
        }

        return BadRequest($"During remove user process accured error, please check your request.");
    }
}
