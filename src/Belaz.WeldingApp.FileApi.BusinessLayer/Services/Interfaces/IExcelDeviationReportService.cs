using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IExcelDeviationReportService
{
    Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkshopAsync(
        GenerateExcelDeviationReportByWorkshopRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportByProductionAreaAsync(
        GenerateExcelDeviationReportByProductionAreaRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportByWelderAsync(
        GenerateExcelDeviationReportByWelderRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkplaceAsync(
        GenerateExcelDeviationReportByWorkplaceRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportAsync(
        GenerateExcelDeviationReportRequest request
    );
}
