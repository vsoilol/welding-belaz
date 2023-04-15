using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelSeamAmountReportService : IExcelSeamAmountReportService
{
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<SeamAmountDto> _excelSeamAmountReportService;
    private readonly ISeamAccountRepository _seamAccountRepository;

    public ExcelSeamAmountReportService(
        IValidationService validationService,
        IExcelFileService<SeamAmountDto> excelSeamAmountReportService,
        ISeamAccountRepository seamAccountRepository
    )
    {
        _validationService = validationService;
        _excelSeamAmountReportService = excelSeamAmountReportService;
        _seamAccountRepository = seamAccountRepository;
    }

    public Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByProductionAreaAsync(
        GenerateExcelSeamAmountReportByProductionAreaRequest request
    )
    {
        return GenerateExcelSeamAmountReportAsync(
            request,
            request.ProductionAreaId,
            _seamAccountRepository.GetSeamAmountByProductionAreaAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWelderAsync(
        GenerateExcelSeamAmountReportByWelderRequest request
    )
    {
        return GenerateExcelSeamAmountReportAsync(
            request,
            request.WelderId,
            _seamAccountRepository.GetSeamAmountByWelderAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWorkplaceAsync(
        GenerateExcelSeamAmountReportByWorkplaceRequest request
    )
    {
        return GenerateExcelSeamAmountReportAsync(
            request,
            request.WorkplaceId,
            _seamAccountRepository.GetSeamAmountByWorkplaceAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWorkshopAsync(
        GenerateExcelSeamAmountReportByWorkshopRequest request
    )
    {
        return GenerateExcelSeamAmountReportAsync(
            request,
            request.WorkshopId,
            _seamAccountRepository.GetSeamAmountByWorkshopAndDatePeriodAsync
        );
    }

    private async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportAsync<T>(
        T request,
        Guid additionalId,
        Func<Guid, DateTime, DateTime, Task<SeamAmountDto?>> getSeamAmountFunc
    )
        where T : GenerateExcelSeamAmountReportRequest
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await getSeamAmountFunc(additionalId, dateStart, dateEnd);

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelSeamAmountReportService.GenerateReportAsync(data);
    }
}
