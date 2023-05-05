using System.Reflection;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
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
        services.AddScoped<IExcelDeviationReportService, ExcelDeviationReportService>();
        services.AddScoped<IExcelSeamAmountReportService, ExcelSeamAmountReportService>();
        services.AddScoped<
            IExcelEquipmentOperationTimeReportService,
            ExcelEquipmentOperationTimeReportService
        >();
        services.AddScoped<
            IExcelEquipmentDowntimeReportService,
            ExcelEquipmentDowntimeReportService
        >();
        services.AddScoped<IExcelWelderOperationReportService, ExcelWelderOperationReportService>();
        services.AddScoped<
            IExcelEquipmentOperationAnalysisReportService,
            ExcelEquipmentOperationAnalysisReportService
        >();
        services.AddScoped<
            IExcelEquipmentEfficiencyReportService,
            ExcelEquipmentEfficiencyReportService
        >();

        services.AddScoped<
            IExcelFileService<DocumentInfo<List<WeldPassageDeviationsDto>>>,
            DeviationsReportService
        >();
        services.AddScoped<IExcelFileService<SeamAmountDto>, SeamAmountReportService>();
        services.AddScoped<IExcelExtensions, ExcelExtensions>();
        services.AddScoped<
            IExcelFileService<DocumentInfo<EquipmentOperationTimeDto>>,
            EquipmentOperationReportService
        >();
        services.AddScoped<
            IExcelFileService<List<EquipmentDowntimeDto>>,
            EquipmentDowntimeReportService
        >();
        services.AddScoped<
            IExcelFileService<DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>>,
            EquipmentOperationAnalysisReportService
        >();
        services.AddScoped<
            IExcelFileService<WelderOperationTimeDto>,
            WelderOperationReportService
        >();
        services.AddScoped<
            IExcelFileService<DocumentInfo<List<EquipmentEfficiencyReportDto>>>,
            EquipmentEfficiencyReportService
        >();

        return services;
    }
}
