using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelSeamAmountReportService
{
    Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWorkshopAsync(
        GenerateExcelSeamAmountReportByWorkshopRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWelderAsync(
        GenerateExcelSeamAmountReportByWelderRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWorkplaceAsync(
        GenerateExcelSeamAmountReportByWorkplaceRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByProductionAreaAsync(
        GenerateExcelSeamAmountReportByProductionAreaRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelSeamAmountReportAsync(
        GenerateExcelSeamAmountReportRequest request
    );
}
