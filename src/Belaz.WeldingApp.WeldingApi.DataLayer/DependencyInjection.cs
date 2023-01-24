using System.Reflection;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.WeldingApi.DataLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddDataLayer(this IServiceCollection services, string connectionString)
    {
        services.AddDbContext<ApplicationContext>(options =>
            options.UseNpgsql(connectionString));
        
        services.AddAutoMapper(Assembly.GetExecutingAssembly());
        
        return services;
    }
}