using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.Contracts;
using Belaz.WeldingApp.IdentityApi.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IdentityApi.Controllers;

[Route("api/auth")]
[ApiController]
public class AuthController : ControllerBase
{
    private readonly IAuthService _authService;

    public AuthController(IAuthService authService)
    {
        _authService = authService;
    }

    /*[AllowAnonymous, HttpPost("register")]
    [ProducesResponseType(typeof(AuthSuccessResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Register([FromBody] RegisterModelContract registerContract)
    {
        var authResponse = await _authManager.Register(registerContract);
        return Ok(authResponse);
    }*/

    [AllowAnonymous, HttpPost("login")]
    [ProducesResponseType(typeof(AuthSuccessResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<AuthSuccessResponse>> Login([FromBody] LoginRequest request)
    {
        var result = await _authService.LoginAsync(request);

        return result.ToOk(_ =>
        {
            HttpContext.Items["id"] = _.UserId;
            HttpContext.Items[ContextItems.LogMessage] = "Пользователь вошёл в систему";
        });
    }

    [Authorize]
    [HttpPost("logout")]
    public async Task<ActionResult<bool>> Logout()
    {
        var response = await _authService.LogoutAsync();

        return response;
    }
}
