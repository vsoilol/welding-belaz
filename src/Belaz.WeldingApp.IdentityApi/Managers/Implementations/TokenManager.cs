﻿using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.Common.Options;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace Belaz.WeldingApp.IdentityApi.Managers.Implementations;

public class TokenManager : ITokenManager
{
    private readonly AuthOptions _authOptions;

    public TokenManager(IOptions<AuthOptions> options)
    {
        _authOptions = options.Value;
    }

    public AuthSuccessResponse GenerateAuthenticationResultForUser(UserData user)
    {
        var tokenHandler = new JwtSecurityTokenHandler();

        var key = Encoding.ASCII.GetBytes(_authOptions.Secret);

        var claims = new List<Claim>
        {
            new Claim(JwtRegisteredClaimNames.Sub, user.Email!),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new Claim(JwtRegisteredClaimNames.Email, user.Email!),
            new Claim("id", user.Id.ToString()),
            new Claim("productionAreaId", user.ProductionAreaId.ToString() ?? ""),
            new Claim(ClaimTypes.Role, user.Role.ToString()),
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
