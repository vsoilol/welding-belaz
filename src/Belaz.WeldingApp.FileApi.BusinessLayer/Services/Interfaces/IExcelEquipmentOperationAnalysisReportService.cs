using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelEquipmentOperationAnalysisReportService
{
    Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportByProductionAreaAsync(
        ExcelEquipmentOperationAnalysisReportByProductionAreaRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportAsync(
        ExcelEquipmentOperationAnalysisReportRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportByWorkshopAsync(
        ExcelEquipmentOperationAnalysisReportByWorkshopRequest request
    );
}
