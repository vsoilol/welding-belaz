using System.Reflection;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using FluentValidation;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddBusinessLayer(this IServiceCollection services)
    {
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddScoped<IValidationService, ValidationService>();
        services.AddScoped<IWorkingShiftService, WorkingShiftService>();
        services.AddScoped<IDayService, DayService>();
        services.AddScoped<ICalendarService, CalendarService>();
        services.AddScoped<IWorkshopService, WorkshopService>();
        services.AddScoped<IProductionAreaService, ProductionAreaService>();
        services.AddScoped<IPostService, PostService>();
        services.AddScoped<IWorkplaceService, WorkplaceService>();
        services.AddScoped<IDowntimeReasonService, DowntimeReasonService>();
        services.AddScoped<IWeldingEquipmentService, WeldingEquipmentService>();
        
        return services;
    }
}