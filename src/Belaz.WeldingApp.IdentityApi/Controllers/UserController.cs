using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.Contracts;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using Belaz.WeldingApp.IdentityApi.Extensions;
using LanguageExt;

namespace Belaz.WeldingApp.IdentityApi.Controllers;

[Route("api/users")]
[ApiController]
[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
public class UserController : ControllerBase
{
    private readonly IUserService _userService;

    public UserController(IUserService userService)
    {
        _userService = userService;
    }

    [HttpGet]
    [AuthorizeRoles(Role.Admin, Role.Master)]
    [ProducesResponseType(typeof(IEnumerable<UserDto>), StatusCodes.Status200OK)]
    public async Task<IActionResult> GetAll()
    {
        var users = await _userService.GetAllAsync();

        HttpContext.Items[ContextItems.LogMessage] = "Получение информации о всех пользователях";

        return Ok(users);
    }

    [HttpGet("{userId}")]
    [AuthorizeRoles(Role.Admin, Role.Master)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<UserDto>> Get([FromRoute] Guid userId)
    {
        var result = await _userService.GetByIdAsync(new GetUserByIdRequest { Id = userId });

        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Получение информации о пользователе: {_.MiddleName} {_.FirstName} {_.LastName}";
        });
    }

    [HttpPost]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status201Created)]
    public async Task<ActionResult<UserDto>> Add([FromBody] CreateUserRequest userContract)
    {
        var result = await _userService.AddAsync(userContract);

        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Добавление нового пользователя: {_.MiddleName} {_.FirstName} {_.LastName}";
        });
    }

    [HttpPut]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status200OK)]
    public async Task<ActionResult<UserDto>> Update(
        [FromBody] UpdateUserRequest request
    )
    {
        var result = await _userService.UpdateAsync(request);

        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Обновление информации о пользователе: {_.MiddleName} {_.FirstName} {_.LastName}";
        });
    }

    [HttpDelete("{userId}")]
    [AuthorizeRoles(Role.Admin)]
    [ProducesResponseType(typeof(Guid), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<Unit>> Delete([FromRoute] Guid userId)
    {
        var userResult = await _userService.GetByIdAsync(new GetUserByIdRequest{Id = userId});
        var user = userResult.Match(
            obj => obj,
            _ => new UserDto()
        );

        var result = await _userService.DeleteAsync(new DeleteUserRequest{Id = userId});

        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Удаление пользователя: {user.MiddleName} {user.FirstName} {user.LastName}";
        });
    }
}
