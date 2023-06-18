using System.Net;
using Belaz.WeldingApp.Common.Attributes;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Models;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.Contracts;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using Belaz.WeldingApp.IdentityApi.Extensions;
using LanguageExt;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Belaz.WeldingApp.IdentityApi.Controllers;

[Route("api/auth")]
public class AuthController : ControllerBase
{
    private readonly IAuthService _authService;
    private readonly IEmailSender _emailSender;

    public AuthController(IAuthService authService, IEmailSender emailSender)
    {
        _authService = authService;
        _emailSender = emailSender;
    }

    [AuthorizeRoles(Role.Admin)]
    [HttpPost("user-credentials")]
    [ProducesResponseType(typeof(UserDto), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<UserDto>> ChangeUserCredentialsAsync([FromBody] ChangeUserCredentialsRequest request)
    {
        var result = await _authService.ChangeUserCredentialsAsync(request);

        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                $"Изменение данных входа в систему для пользователя: {_.MiddleName} {_.FirstName} {_.LastName}";
        });
    }

    [Authorize]
    [HttpPost("change-password")]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<Unit>> ChangePasswordAsync([FromBody] ChangePasswordWithoutIdRequest request)
    {
        var result = await _authService.ChangePasswordAsync(new ChangePasswordRequest
        {
            Id = Guid.Parse(User.Claims.First(i => i.Type == "id").Value),
            ConfirmNewPassword = request.ConfirmNewPassword,
            OldPassword = request.OldPassword,
            NewPassword = request.NewPassword
        });

        return result.ToOk(_ =>
        {
            HttpContext.Items[ContextItems.LogMessage] =
                "Пользователь поменял пароль";
        });
    }

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

        HttpContext.Items[ContextItems.LogMessage] = "Пользователь вышел из системы";

        return response;
    }


    [AllowAnonymous, HttpGet("confirmEmail")]
    public async Task<ActionResult> ConfirmEmail([FromQuery] ConfirmEmailResponse request)
    {
        var isConfirm = await _authService.ConfirmEmailAsync(request.Id, request.Token);

        var status = isConfirm
            ? "Thank you for confirming your email"
            : "Your email is not confirmed, please try again later";

        HttpContext.Items["id"] = request.Id;
        HttpContext.Items[ContextItems.LogMessage] = "Пользователь подтвердил электронную почту";

        return Ok(status);
    }

    [AuthorizeRoles(Role.Admin)]
    [HttpPost("send-email-confirmation/{id}")]
    public async Task<ActionResult> ReConfirmEmail([FromRoute] Guid id)
    {
        var confirmationEmailInfoResult = await _authService
            .GenerateEmailConfirmationTokenAsync(new GenerateEmailConfirmationTokenRequest { Id = id });

        var confirmationEmailInfo = confirmationEmailInfoResult.GetDataOrNullFromResult();

        if (confirmationEmailInfo is not null)
        {
            var confirmationLink = Url.Action(
                nameof(ConfirmEmail),
                "Auth",
                new { token = confirmationEmailInfo.Token, id = confirmationEmailInfo.Id },
                Request.Scheme);
            //var realApi = Environment.GetEnvironmentVariable("REAL_API")!;
            /*var confirmationLink =
                $@"{realApi}/api/auth/confirmEmail?token={confirmationEmailInfo.Token}&id={confirmationEmailInfo.Id}";*/

            var emailBody = $"Please confirm your email address <a href=\"{confirmationLink}\">Click here</a>";

            var message = new Message(new[] { confirmationEmailInfo.Email },
                "Confirm email",
                emailBody);

            await _emailSender.SendEmailAsync(message);
        }

        return confirmationEmailInfoResult.ToEmptyOk(
            _ =>
            {
                HttpContext.Items[ContextItems.LogMessage] =
                    $"Отправка сообщения на подтверждения электронной почты для пользователя {_.Email}";
            });
    }
}
