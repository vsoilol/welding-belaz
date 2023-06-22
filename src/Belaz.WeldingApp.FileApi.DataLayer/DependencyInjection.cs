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
        services.AddScoped<IMasterRepository, MasterRepository>();
        services.AddScoped<IInspectorRepository, InspectorRepository>();
        services.AddScoped<IWeldPassageRepository, WeldPassageRepository>();
        services.AddScoped<ISeamAccountRepository, SeamAccountRepository>();
        services.AddScoped<IWeldingEquipmentRepository, WeldingEquipmentRepository>();
        services.AddScoped<IWelderRepository, WelderRepository>();
        services.AddScoped<ICalendarRepository, CalendarRepository>();
        services.AddScoped<IProductAccountRepository, ProductAccountRepository>();
        services.AddScoped<IProductRepository, ProductRepository>();
        services.AddScoped<ISeamRepository, SeamRepository>();
        services.AddScoped<IWorkshopRepository, WorkshopRepository>();
        services.AddScoped<IWorkplaceRepository, WorkplaceRepository>();
        services.AddScoped<IProductionAreaRepository, ProductionAreaRepository>();
        services.AddScoped<IDayRepository, DayRepository>();
        services.AddScoped<IWorkingShiftRepository, WorkingShiftRepository>();
        
        return services;
    }
}
