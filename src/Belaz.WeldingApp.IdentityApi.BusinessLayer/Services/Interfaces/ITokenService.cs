using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;

public interface ITokenService
{
    AuthSuccessResponse GenerateAuthenticationResultForUser(IdentityUserDto user);
}
