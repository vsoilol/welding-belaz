using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelDeviationReportService : IExcelDeviationReportService
{
    private readonly IWeldPassageRepository _weldPassageRepository;
    private readonly IExcelFileService<DocumentInfo<List<WeldPassageDeviationsDto>>> _excelDeviationReportService;
    private readonly IValidationService _validationService;
    private readonly IProductRepository _productRepository;
    private readonly ISeamRepository _seamRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;
    private readonly IWorkshopRepository _workshopRepository;
    private readonly IWorkplaceRepository _workplaceRepository;
    private readonly IWelderRepository _welderRepository;

    public ExcelDeviationReportService(
        IWeldPassageRepository weldPassageRepository,
        IExcelFileService<DocumentInfo<List<WeldPassageDeviationsDto>>> excelDeviationReportService,
        IValidationService validationService, IProductRepository productRepository,
        ISeamRepository seamRepository, IWelderRepository welderRepository, IWorkplaceRepository workplaceRepository,
        IWorkshopRepository workshopRepository, IProductionAreaRepository productionAreaRepository)
    {
        _weldPassageRepository = weldPassageRepository;
        _excelDeviationReportService = excelDeviationReportService;
        _validationService = validationService;
        _productRepository = productRepository;
        _seamRepository = seamRepository;
        _welderRepository = welderRepository;
        _workplaceRepository = workplaceRepository;
        _workshopRepository = workshopRepository;
        _productionAreaRepository = productionAreaRepository;
    }

    public async Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkshopAsync(
        GenerateExcelDeviationReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }
        
        var workshop = await _workshopRepository.GetBriefInfoByIdAsync(request.WorkshopId);
        
        return await GenerateExcelDeviationReportAsync(
            request,
            request.WorkshopId,
            _weldPassageRepository.GetAllDeviationsByWorkshopAndDatePeriodAsync,
            $"Отчёт в разрезе цеха: {workshop.Number} {workshop.Name}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelDeviationReportByProductionAreaAsync(
        GenerateExcelDeviationReportByProductionAreaRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var productionArea = await _productionAreaRepository.GetBriefInfoByIdAsync(request.ProductionAreaId);
        
        return await GenerateExcelDeviationReportAsync(
            request,
            request.ProductionAreaId,
            _weldPassageRepository.GetAllDeviationsByProductionAreaAndDatePeriodAsync,
            $"Отчёт в разрезе производственного участка: {productionArea.Number} {productionArea.Name}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelDeviationReportByWelderAsync(
        GenerateExcelDeviationReportByWelderRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var welder = await _welderRepository.GetUserFullNameByIdAsync(request.WelderId);
        
        return await GenerateExcelDeviationReportAsync(
            request,
            request.WelderId,
            _weldPassageRepository.GetAllDeviationsByWelderAndDatePeriodAsync,
            $"Отчёт в разрезе сварщика: {welder.MiddleName} {welder.FirstName} {welder.LastName}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkplaceAsync(
        GenerateExcelDeviationReportByWorkplaceRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var workplace = await _workplaceRepository.GetBriefInfoByIdAsync(request.WorkplaceId);
        
        return await GenerateExcelDeviationReportAsync(
            request,
            request.WorkplaceId,
            _weldPassageRepository.GetAllDeviationsByWorkplaceAndDatePeriodAsync,
            $"Отчёт в разрезе рабочего места: {workplace.Number}"
        );
    }

    public async Task<Result<DocumentDto>> GenerateExcelDeviationReportAsync(
        GenerateExcelDeviationReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var deviations = await _weldPassageRepository.GetAllDeviationsByDatePeriodAsync(
            request.ProductId,
            request.SeamId,
            dateStart,
            dateEnd
        );

        if (!deviations.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var productTitle = await GetProductAndSeamTitleInfoAsync(request.ProductId, request.SeamId);

        var result = new DocumentInfo<List<WeldPassageDeviationsDto>>
        {
            Data = deviations,
            TitleText = new string[]
            {
                "Отчёт в разрезе завода",
                productTitle,
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelDeviationReportService.GenerateReportAsync(result);
    }

    private async Task<Result<DocumentDto>> GenerateExcelDeviationReportAsync<T>(
        T request,
        Guid additionalId,
        Func<
            Guid,
            Guid?,
            Guid?,
            DateTime,
            DateTime,
            Task<List<WeldPassageDeviationsDto>>
        > getAllDeviationsFunc,
        string title
    )
        where T : GenerateExcelDeviationReportRequest
    {
        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var deviations = await getAllDeviationsFunc(
            additionalId,
            request.ProductId,
            request.SeamId,
            dateStart,
            dateEnd
        );

        if (!deviations.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var productTitle = await GetProductAndSeamTitleInfoAsync(request.ProductId, request.SeamId);

        var result = new DocumentInfo<List<WeldPassageDeviationsDto>>
        {
            Data = deviations,
            TitleText = new string[]
            {
                title,
                productTitle,
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelDeviationReportService.GenerateReportAsync(result);
    }

    private async Task<string> GetProductAndSeamTitleInfoAsync(Guid? productId, Guid? seamId)
    {
        if (productId is null)
        {
            return "Для всех изделий, узлов и деталей";
        }
        
        var product = await _productRepository.GetBriefInfoByIdAsync((Guid)productId);

        if (seamId is not null)
        {
            var seam = await _seamRepository.GetBriefInfoByIdAsync((Guid)seamId);

            var seamProductText = product.ProductType switch
            {
                ProductType.Product => "изделию",
                ProductType.Knot => "узлу",
                ProductType.Detail => "детале",
                _ => ""
            };

            return $"Для сварного шва {seam.Number} " +
                   $"принадлежащий {seamProductText} {product.Number} {product.Name}";
        }

        var productText = product.ProductType switch
        {
            ProductType.Product => "изделия",
            ProductType.Knot => "узла",
            ProductType.Detail => "детали",
            _ => ""
        };

        return $"Для {productText} {product.Number} {product.Name}";
    }
}