using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.Identity;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;

public interface IAuthService
{
    Task<Result<AuthSuccessResponse>> ChangeUserCredentialsAsync(ChangeUserCredentialsRequest request);

    Task<Result<AuthSuccessResponse>> LoginAsync(LoginRequest request);

    Task<Result<ConfirmEmailResponse>> GenerateEmailConfirmationTokenAsync(
        GenerateEmailConfirmationTokenRequest request);

    Task<bool> ConfirmEmailAsync(Guid id, string token);

    Task<bool> LogoutAsync();
}