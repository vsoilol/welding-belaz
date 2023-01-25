using System.Reflection;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.WeldingApi.Domain;

public static class DependencyInjection
{
    public static IServiceCollection AddDomainLayer(this IServiceCollection services)
    {
        services.AddAutoMapper(Assembly.GetExecutingAssembly());
        
        return services;
    }
}