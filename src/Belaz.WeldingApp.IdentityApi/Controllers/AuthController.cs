using Belaz.WeldingApp.IdentityApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IdentityApi.Controllers;

[Route("api/auth")]
[ApiController]
public class AuthController : ControllerBase
{
    private readonly IAuthManager _authManager;

    public AuthController(IAuthManager authManager)
    {
        _authManager = authManager;
    }

    [AllowAnonymous, HttpPost("register")]
    [ProducesResponseType(typeof(AuthSuccessResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Register([FromBody] RegisterModelContract registerContract)
    {
        var authResponse = await _authManager.Register(registerContract);
        return Ok(authResponse);
    }

    [AllowAnonymous, HttpPost("login")]
    [ProducesResponseType(typeof(AuthSuccessResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Login([FromBody] LoginModelContract loginContract)
    {
        var authResponse = await _authManager.Login(loginContract);
        return Ok(authResponse);
    }

    [Authorize]
    [HttpPost("logout")]
    public async Task<ActionResult<bool>> Logout()
    {
        var response = await _authManager.Logout();

        return response;
    }
}
