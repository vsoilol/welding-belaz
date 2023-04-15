﻿using System.Reflection;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.Helpers.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
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
        services.AddScoped<IExcelDeviationReportService, ExcelDeviationReportService>();

        services.AddScoped<
            IExcelFileService<List<WeldPassageDeviationsDto>>,
            DeviationsReportService
        >();
        services.AddScoped<IExcelFileService<SeamAmountDto>, SeamAmountReportService>();
        services.AddScoped<IExcelExtensions, ExcelExtensions>();
        services.AddScoped<
            IExcelFileService<EquipmentOperationTimeDto>,
            EquipmentOperationReportService
        >();
        services.AddScoped<
            IExcelFileService<List<EquipmentDowntimeDto>>,
            EquipmentDowntimeReportService
        >();
        services.AddScoped<
            IExcelFileService<List<EquipmentOperationTimeWithShiftDto>>,
            EquipmentOperationAnalysisReportService
        >();
        services.AddScoped<
            IExcelFileService<WelderOperationTimeDto>,
            WelderOperationReportService
        >();
        services.AddScoped<
            IExcelFileService<List<EquipmentEfficiencyReportDto>>,
            EquipmentEfficiencyReportService
        >();

        return services;
    }
}
