using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Options;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Implementations;

internal class TokenService : ITokenService
{
    private readonly AuthOptions _authOptions;

    public TokenService(IOptions<AuthOptions> options)
    {
        _authOptions = options.Value;
    }

    public AuthSuccessResponse GenerateAuthenticationResultForUser(IdentityUserDto user)
    {
        var tokenHandler = new JwtSecurityTokenHandler();

        var key = Encoding.ASCII.GetBytes(_authOptions.Secret);

        var claims = new List<Claim>
        {
            new(JwtRegisteredClaimNames.Sub, user.Email!),
            new(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new(JwtRegisteredClaimNames.Email, user.Email!),
            new("id", user.Id.ToString()),
            new("productionAreaId", user.ProductionAreaId.ToString() ?? ""),
            new(ClaimTypes.Role, user.Role.ToString()),
        };

        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(claims),
            IssuedAt = DateTime.UtcNow,
            Expires = DateTime.UtcNow.Add(_authOptions.TokenLifetime),
            SigningCredentials = new SigningCredentials(
                new SymmetricSecurityKey(key),
                SecurityAlgorithms.HmacSha256Signature
            ),
        };

        return new AuthSuccessResponse
        {
            UserId = user.Id,
            ExpirationDate = tokenDescriptor.Expires.Value.ToString("MM/dd/yyyy HH:mm:ss"),
            Token = tokenHandler.CreateEncodedJwt(tokenDescriptor),
        };
    }
}