using Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Implementations;
using Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.IdentityApi.DataLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddDataLayer(
        this IServiceCollection services,
        string connectionString
    )
    {
        services.AddDbContext<ApplicationContext>(options => options.UseNpgsql(connectionString));
        
        services.AddScoped<IUserRepository, UserRepository>();

        return services;
    }
}