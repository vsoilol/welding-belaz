using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.RegistarApi.DataLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddDataLayer(
        this IServiceCollection services,
        string connectionString
    )
    {
        services.AddDbContext<ApplicationContext>(options => options.UseNpgsql(connectionString));

        services.AddScoped<IWeldingEquipmentRepository, WeldingEquipmentRepository>();
        services.AddScoped<IWelderRepository, WelderRepository>();
        services.AddScoped<IRecordRepository, RecordRepository>();
        services.AddScoped<IMasterRepository, MasterRepository>();
        services.AddScoped<IWeldingTaskRepository, WeldingTaskRepository>();

        return services;
    }
}
