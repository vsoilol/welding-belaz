using Belaz.WeldingApp.IntegrationApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IAuthIntegrationApi
{
    Task<AuthSuccessResponse> Register(RegisterModelContract registerContract);

    Task<AuthSuccessResponse> Login(LoginModelContract loginContract);

    Task<bool> Logout();
}
