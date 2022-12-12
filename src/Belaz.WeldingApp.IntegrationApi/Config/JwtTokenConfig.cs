using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

namespace Belaz.WeldingApp.IntegrationApi.Config;

public static class JwtTokenConfig
{
    public static void SetupJwtTokens(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8
                        .GetBytes(configuration.GetSection("Auth:Secret").Value)),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                };
            });
    }
}
