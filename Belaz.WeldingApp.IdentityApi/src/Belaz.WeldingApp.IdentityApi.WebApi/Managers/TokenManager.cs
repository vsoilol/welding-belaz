using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Options;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers
{
    public class TokenManager : ITokenManager
    {
        private readonly AuthOptions _authOptions;

        public TokenManager(IOptions<AuthOptions> options)
        {
            _authOptions = options.Value;
        }

        public AuthenticationResult GenerateAuthenticationResultForUser(UserData user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();

            var key = Encoding.ASCII.GetBytes(_authOptions.Secret);

            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim("id", user.Id.ToString()),
            };

            claims.AddRange(user.Roles.Select(_ => new Claim(ClaimTypes.Role, _.Name)));

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.Add(_authOptions.TokenLifetime),
                SigningCredentials =
                    new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature),
            };

            return new AuthenticationResult
            {
                Success = true,
                UserId = user.Id,
                ExpirationDate = tokenDescriptor.Expires.Value.ToLocalTime().ToString("MM/dd/yyyy HH:mm:ss"),
                Token = tokenHandler.CreateEncodedJwt(tokenDescriptor),
            };
        }
    }
}
