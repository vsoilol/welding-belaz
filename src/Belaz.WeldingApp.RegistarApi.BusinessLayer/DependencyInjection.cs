using System.Reflection;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Services;
using FluentValidation;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddBusinessLayer(this IServiceCollection services)
    {
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddScoped<IValidationService, ValidationService>();

        return services;
    }
}