using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelWelderOperationReportService : IExcelWelderOperationReportService
{
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<WelderOperationTimeDto> _excelWelderOperationReportService;

    public ExcelWelderOperationReportService(
        IValidationService validationService,
        IExcelFileService<WelderOperationTimeDto> excelWelderOperationReportService
    )
    {
        _validationService = validationService;
        _excelWelderOperationReportService = excelWelderOperationReportService;
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByProductionAreaAsync(
        GenerateExcelWelderOperationReportByProductionAreaRequest request
    )
    {
        throw new NotImplementedException();
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWelderAsync(
        GenerateExcelWelderOperationReportByWelderRequest request
    )
    {
        throw new NotImplementedException();
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkplaceAsync(
        GenerateExcelWelderOperationReportByWorkplaceRequest request
    )
    {
        throw new NotImplementedException();
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkshopAsync(
        GenerateExcelWelderOperationReportByWorkshopRequest request
    )
    {
        throw new NotImplementedException();
    }
}
