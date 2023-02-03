﻿using System.Reflection;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using FluentValidation;
using Microsoft.Extensions.DependencyInjection;

namespace Belaz.WeldingApp.FileApi.BusinessLayer;

public static class DependencyInjection
{
    public static IServiceCollection AddBusinessLayer(this IServiceCollection services)
    {
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddScoped<IValidationService, ValidationService>();
        services.AddScoped<IFileService, FileService>();
        services.AddScoped<IMarkEstimateService, MarkEstimateService>();

        return services;
    }
}