using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.FileApi.DataLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddDataLayer(
        this IServiceCollection services,
        string connectionString
    )
    {
        services.AddDbContext<ApplicationContext>(options => options.UseNpgsql(connectionString));

        services.AddScoped<ITaskRepository, TaskRepository>();
        services.AddScoped<IWeldPassageRepository, WeldPassageRepository>();
        services.AddScoped<ISeamAccountRepository, SeamAccountRepository>();
        services.AddScoped<IWeldingEquipmentRepository, WeldingEquipmentRepository>();

        return services;
    }
}
