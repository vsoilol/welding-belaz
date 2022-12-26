using Belaz.WeldingApp.IntegrationApi.Common;
using Belaz.WeldingApp.IntegrationApi.DelegatingHandlers;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Implementations;
using Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;
using Microsoft.Extensions.Http;

namespace Belaz.WeldingApp.IntegrationApi.Config;

public static class RegisterIntegrationApiConfig
{
    public static void RegisterIntegrationApis(this IServiceCollection services, IConfiguration configuration, ApiOptions apiUrls)
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
            c => c.BaseAddress = new Uri(apiUrls.UserApiBaseUrl));

        services.AddHttpClient<IAuthIntegrationApi, AuthIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.UserApiBaseUrl));

        services.AddHttpClient<IWelderIntegrationApi, WelderIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IWeldingEquipmentIntegrationApi, WeldingEquipmentIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IDetailIntegrationApi, DetailIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IKnotIntegrationApi, KnotIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IPostIntegrationApi, PostIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IProductIntegrationApi, ProductIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IProductionAreaIntegrationApi, ProductionAreaIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<ISeamIntegrationApi, SeamIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<ITechnologicalProcessIntegrationApi, TechnologicalProcessIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IWeldingTaskIntegrationApi, WeldingTaskIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IWorkplaceIntegrationApi, WorkplaceIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));

        services.AddHttpClient<IWorkshopIntegrationApi, WorkshopIntegrationApi>(
            c => c.BaseAddress = new Uri(apiUrls.WeldingApiBaseUrl));
    }
}
