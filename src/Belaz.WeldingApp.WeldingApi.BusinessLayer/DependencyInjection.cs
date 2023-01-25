using System.Reflection;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Common;
using FluentValidation;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddBusinessLayer(this IServiceCollection services)
    {
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
        
        services.AddScoped<IChiefService, ChiefService>();
        
        return services;
    }
}