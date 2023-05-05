using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
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
    private readonly IExcelFileService<DocumentInfo<SeamAmountDto>> _excelSeamAmountReportService;
    private readonly ISeamAccountRepository _seamAccountRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;
    private readonly IWorkshopRepository _workshopRepository;
    private readonly IWorkplaceRepository _workplaceRepository;
    private readonly IWelderRepository _welderRepository;

    public ExcelSeamAmountReportService(
        IValidationService validationService,
        IExcelFileService<DocumentInfo<SeamAmountDto>> excelSeamAmountReportService,
        ISeamAccountRepository seamAccountRepository, IWorkshopRepository workshopRepository,
        IProductionAreaRepository productionAreaRepository, IWorkplaceRepository workplaceRepository,
        IWelderRepository welderRepository)
    {
        _validationService = validationService;
        _excelSeamAmountReportService = excelSeamAmountReportService;
        _seamAccountRepository = seamAccountRepository;
        _workshopRepository = workshopRepository;
        _productionAreaRepository = productionAreaRepository;
        _workplaceRepository = workplaceRepository;
        _welderRepository = welderRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportAsync(
        GenerateExcelSeamAmountReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await _seamAccountRepository.GetSeamAmountByDatePeriodAsync(dateStart, dateEnd);

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }
        
        var result = new DocumentInfo<SeamAmountDto>
        {
            Data = data,
            TitleText = new []
            {
                "Отчёт в разрезе завода",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelSeamAmountReportService.GenerateReportAsync(result);
    }

    public async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByProductionAreaAsync(
        GenerateExcelSeamAmountReportByProductionAreaRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var productionArea = await _productionAreaRepository.GetBriefInfoByIdAsync(request.ProductionAreaId);

        return await GenerateExcelSeamAmountReportAsync(
            request,
            request.ProductionAreaId,
            _seamAccountRepository.GetSeamAmountByProductionAreaAndDatePeriodAsync,
            $"Отчёт в разрезе производственного участка: {productionArea.Number} {productionArea.Name}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWelderAsync(
        GenerateExcelSeamAmountReportByWelderRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var welder = await _welderRepository.GetUserFullNameByIdAsync(request.WelderId);

        return await GenerateExcelSeamAmountReportAsync(
            request,
            request.WelderId,
            _seamAccountRepository.GetSeamAmountByWelderAndDatePeriodAsync,
            $"Отчёт в разрезе сварщика: {welder.MiddleName} {welder.FirstName} {welder.LastName}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWorkplaceAsync(
        GenerateExcelSeamAmountReportByWorkplaceRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var workplace = await _workplaceRepository.GetBriefInfoByIdAsync(request.WorkplaceId);

        return await GenerateExcelSeamAmountReportAsync(
            request,
            request.WorkplaceId,
            _seamAccountRepository.GetSeamAmountByWorkplaceAndDatePeriodAsync,
            $"Отчёт в разрезе рабочего места: {workplace.Number}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportByWorkshopAsync(
        GenerateExcelSeamAmountReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var workshop = await _workshopRepository.GetBriefInfoByIdAsync(request.WorkshopId);

        return await GenerateExcelSeamAmountReportAsync(
            request,
            request.WorkshopId,
            _seamAccountRepository.GetSeamAmountByWorkshopAndDatePeriodAsync,
            $"Отчёт в разрезе цеха: {workshop.Number} {workshop.Name}"
        );
    }

    private async Task<Result<DocumentDto>> GenerateExcelSeamAmountReportAsync<T>(
        T request,
        Guid additionalId,
        Func<Guid, DateTime, DateTime, Task<SeamAmountDto?>> getSeamAmountFunc,
        string title
    )
        where T : GenerateExcelSeamAmountReportRequest
    {
        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await getSeamAmountFunc(additionalId, dateStart, dateEnd);

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var result = new DocumentInfo<SeamAmountDto>
        {
            Data = data,
            TitleText = new[]
            {
                title,
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelSeamAmountReportService.GenerateReportAsync(result);
    }
}