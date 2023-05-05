using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
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
    private readonly IExcelFileService<DocumentInfo<WelderOperationTimeDto>> _excelWelderOperationReportService;
    private readonly IWelderRepository _welderRepository;
    private readonly IWorkshopRepository _workshopRepository;
    private readonly IWorkplaceRepository _workplaceRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;

    public ExcelWelderOperationReportService(
        IValidationService validationService,
        IExcelFileService<DocumentInfo<WelderOperationTimeDto>> excelWelderOperationReportService,
        IWelderRepository welderRepository, IProductionAreaRepository productionAreaRepository,
        IWorkplaceRepository workplaceRepository, IWorkshopRepository workshopRepository)
    {
        _validationService = validationService;
        _excelWelderOperationReportService = excelWelderOperationReportService;
        _welderRepository = welderRepository;
        _productionAreaRepository = productionAreaRepository;
        _workplaceRepository = workplaceRepository;
        _workshopRepository = workshopRepository;
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
        
        var result = new DocumentInfo<WelderOperationTimeDto>
        {
            Data = data,
            TitleText = new []
            {
                "Отчёт в разрезе завода",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelWelderOperationReportService.GenerateReportAsync(result);
    }

    public async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByProductionAreaAsync(
        GenerateExcelWelderOperationReportByProductionAreaRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var productionArea = await _productionAreaRepository.GetBriefInfoByIdAsync(request.ProductionAreaId);
        
        return await GenerateExcelWelderOperationReportAsync(
            request,
            request.ProductionAreaId,
            _welderRepository.GetWelderOperationTimeInfoByProductionAreaIdAndDatePeriodAsync,
            $"Отчёт в разрезе производственного участка: {productionArea.Number} {productionArea.Name}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWelderAsync(
        GenerateExcelWelderOperationReportByWelderRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var welder = await _welderRepository.GetUserFullNameByIdAsync(request.WelderId);
        
        return await GenerateExcelWelderOperationReportAsync(
            request,
            request.WelderId,
            _welderRepository.GetWelderOperationTimeInfoByWelderIdAndDatePeriodAsync,
            $"Отчёт в разрезе сварщика: {welder.MiddleName} {welder.FirstName} {welder.LastName}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkplaceAsync(
        GenerateExcelWelderOperationReportByWorkplaceRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var workplace = await _workplaceRepository.GetBriefInfoByIdAsync(request.WorkplaceId);
        
        return await GenerateExcelWelderOperationReportAsync(
            request,
            request.WorkplaceId,
            _welderRepository.GetWelderOperationTimeInfoByWorkplaceIdAndDatePeriodAsync,
            $"Отчёт в разрезе рабочего места: {workplace.Number}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportByWorkshopAsync(
        GenerateExcelWelderOperationReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var workshop = await _workshopRepository.GetBriefInfoByIdAsync(request.WorkshopId);
        
        return await GenerateExcelWelderOperationReportAsync(
            request,
            request.WorkshopId,
            _welderRepository.GetWelderOperationTimeInfoByWorkshopIdAndDatePeriodAsync,
            $"Отчёт в разрезе цеха: {workshop.Number} {workshop.Name}"
        );
    }

    private async Task<Result<DocumentDto>> GenerateExcelWelderOperationReportAsync<T>(
        T request,
        Guid additionalId,
        Func<Guid, DateTime, DateTime, Task<WelderOperationTimeDto?>> getWelderOperationTimeFunc,
        string title
    )
        where T : GenerateExcelWelderOperationReportRequest
    {
        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var data = await getWelderOperationTimeFunc(additionalId, dateStart, dateEnd);

        if (data is null)
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }
        
        var result = new DocumentInfo<WelderOperationTimeDto>
        {
            Data = data,
            TitleText = new string[]
            {
                title,
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelWelderOperationReportService.GenerateReportAsync(result);
    }
}