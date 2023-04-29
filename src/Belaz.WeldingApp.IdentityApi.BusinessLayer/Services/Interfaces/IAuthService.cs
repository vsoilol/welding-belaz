using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using LanguageExt.Common;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;

public interface IAuthService
{
    Task<Result<AuthSuccessResponse>> ChangeUserCredentialsAsync(ChangeUserCredentialsRequest request);

    Task<Result<AuthSuccessResponse>> LoginAsync(LoginRequest request);

    Task<bool> LogoutAsync();
}
