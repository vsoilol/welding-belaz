using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelEquipmentEfficiencyReportService
{
    Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByWorkshopAsync(
        ExcelEquipmentEfficiencyReportByWorkshopRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByWorkplaceAsync(
        ExcelEquipmentEfficiencyReportByWorkplaceRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportByProductionAreaAsync(
        ExcelEquipmentEfficiencyReportByProductionAreaRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportAsync(
        ExcelEquipmentEfficiencyReportRequest request
    );
}
