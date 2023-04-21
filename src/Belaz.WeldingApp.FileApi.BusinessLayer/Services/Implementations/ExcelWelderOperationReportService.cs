using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelWelderOperationReportService : IExcelWelderOperationReportService
{
    private readonly IValidationService _validationService;
    private readonly IExcelFileService<WelderOperationTimeDto> _excelWelderOperationReportService;
    private readonly IWelderRepository _welderRepository;

    public ExcelWelderOperationReportService(
        IValidationService validationService,
        IExcelFileService<WelderOperationTimeDto> excelWelderOperationReportService,
        IWelderRepository welderRepository
    )
    {
        _validationService = validationService;
        _excelWelderOperationReportService = excelWelderOperationReportService;
        _welderRepository = welderRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportAsync(
        GenerateExcelWelderOperationReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await _welderRepository.GetWelderOperationTimeInfoAndDatePeriodAsync(
            dateStart,
            dateEnd
        );

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelWelderOperationReportService.GenerateReportAsync(data);
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByProductionAreaAsync(
        GenerateExcelWelderOperationReportByProductionAreaRequest request
    )
    {
        return GenerateExcelWelderOperationReportAsync(
            request,
            request.ProductionAreaId,
            _welderRepository.GetWelderOperationTimeInfoByProductionAreaIdAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWelderAsync(
        GenerateExcelWelderOperationReportByWelderRequest request
    )
    {
        return GenerateExcelWelderOperationReportAsync(
            request,
            request.WelderId,
            _welderRepository.GetWelderOperationTimeInfoByWelderIdAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkplaceAsync(
        GenerateExcelWelderOperationReportByWorkplaceRequest request
    )
    {
        return GenerateExcelWelderOperationReportAsync(
            request,
            request.WorkplaceId,
            _welderRepository.GetWelderOperationTimeInfoByWorkplaceIdAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkshopAsync(
        GenerateExcelWelderOperationReportByWorkshopRequest request
    )
    {
        return GenerateExcelWelderOperationReportAsync(
            request,
            request.WorkshopId,
            _welderRepository.GetWelderOperationTimeInfoByWorkshopIdAndDatePeriodAsync
        );
    }

    private async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportAsync<T>(
        T request,
        Guid additionalId,
        Func<Guid, DateTime, DateTime, Task<WelderOperationTimeDto?>> getWelderOperationTimeFunc
    )
        where T : GenerateExcelWelderOperationReportRequest
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await getWelderOperationTimeFunc(additionalId, dateStart, dateEnd);

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelWelderOperationReportService.GenerateReportAsync(data);
    }
}
