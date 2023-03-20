using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface IFileService
{
    Task<Result<DocumentDto>> GenerateSeamPassportByTaskIdAsync(
        GenerateSeamPassportByTaskIdRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkshopAsync(
        GenerateExcelDeviationReportByWorkshopRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportByProductionAreaAsync(
        GenerateExcelDeviationReportByProductionAreaRequest request
    );

    Task<Result<DocumentDto>> GenerateExcelDeviationReportByWelderAsync(
        GenerateExcelDeviationReportByWelderRequest request
    );
}
