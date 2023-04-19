using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelWelderOperationReportService
{
    Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkshopAsync(
        GenerateExcelWelderOperationReportByWorkshopRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWelderAsync(
        GenerateExcelWelderOperationReportByWelderRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkplaceAsync(
        GenerateExcelWelderOperationReportByWorkplaceRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByProductionAreaAsync(
        GenerateExcelWelderOperationReportByProductionAreaRequest request
    );
}
