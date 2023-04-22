using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;

namespace Belaz.WeldingApp.IdentityApi.Managers.Interfaces;

public interface ITokenManager
{
    AuthSuccessResponse GenerateAuthenticationResultForUser(UserData user);
}
