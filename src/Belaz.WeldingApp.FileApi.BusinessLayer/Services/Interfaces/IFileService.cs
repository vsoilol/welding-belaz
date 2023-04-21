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

    Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportAsync();

    Task<Result<DocumentDto>> GenerateExcelEquipmentEfficiencyReportAsync();
}
