using Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces;

public interface ITokenManager
{
    AuthSuccessResponse GenerateAuthenticationResultForUser(UserData user);
}
