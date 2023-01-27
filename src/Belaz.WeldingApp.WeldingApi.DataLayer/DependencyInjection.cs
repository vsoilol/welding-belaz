using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.WeldingApi.DataLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddDataLayer(this IServiceCollection services, string connectionString)
    {
        services.AddDbContext<ApplicationContext>(options =>
            options.UseNpgsql(connectionString));

        services.AddScoped<ICalendarRepository, CalendarRepository>();
        services.AddScoped<IProductionAreaRepository, ProductionAreaRepository>();
        services.AddScoped<IWeldingEquipmentRepository, WeldingEquipmentRepository>();
        services.AddScoped<IWorkingShiftRepository, WorkingShiftRepository>();
        services.AddScoped<IDayRepository, DayRepository>();
        services.AddScoped<ICalendarRepository, CalendarRepository>();
        services.AddScoped<IWorkshopRepository, WorkshopRepository>();
        services.AddScoped<IPostRepository, PostRepository>();
        services.AddScoped<IWorkplaceRepository, WorkplaceRepository>();
        
        return services;
    }
}