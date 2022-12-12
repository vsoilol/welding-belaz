using Belaz.WeldingApp.IntegrationApi.DelegatingHandlers;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.Extensions.Http;

namespace Belaz.WeldingApp.IntegrationApi.Config;

public static class RegisterIntegrationApiConfig
{
    public static void RegisterIntegrationApis(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddTransient<JwtHeaderHandler>();

        services.ConfigureAll<HttpClientFactoryOptions>(options =>
        {
            options.HttpMessageHandlerBuilderActions.Add(builder =>
            {
                builder.AdditionalHandlers.Add(builder.Services.GetRequiredService<JwtHeaderHandler>());
            });
        });

        services.AddHttpClient<IUserIntegrationApi, UserIntegrationApi>(
            c => c.BaseAddress = new Uri(configuration["Api:UserApiBaseUrl"]));

        services.AddHttpClient<IAuthIntegrationApi, AuthIntegrationApi>(
            c => c.BaseAddress = new Uri(configuration["Api:UserApiBaseUrl"]));
    }
}
