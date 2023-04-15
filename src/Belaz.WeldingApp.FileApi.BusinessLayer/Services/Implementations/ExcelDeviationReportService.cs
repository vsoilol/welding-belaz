using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
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

    private readonly IExcelFileService<List<WeldPassageDeviationsDto>> _excelDeviationReportService;
    private readonly IValidationService _validationService;

    public ExcelDeviationReportService(
        IWeldPassageRepository weldPassageRepository,
        IExcelFileService<List<WeldPassageDeviationsDto>> excelDeviationReportService,
        IValidationService validationService
    )
    {
        _weldPassageRepository = weldPassageRepository;
        _excelDeviationReportService = excelDeviationReportService;
        _validationService = validationService;
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkshopAsync(
        GenerateExcelDeviationReportByWorkshopRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.WorkshopId,
            _weldPassageRepository.GetAllDeviationsByWorkshopAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByProductionAreaAsync(
        GenerateExcelDeviationReportByProductionAreaRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.ProductionAreaId,
            _weldPassageRepository.GetAllDeviationsByProductionAreaAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByWelderAsync(
        GenerateExcelDeviationReportByWelderRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.WelderId,
            _weldPassageRepository.GetAllDeviationsByWelderAndDatePeriodAsync
        );
    }

    public Task<Result<DocumentDto>> GenerateExcelDeviationReportByWorkplaceAsync(
        GenerateExcelDeviationReportByWorkplaceRequest request
    )
    {
        return GenerateExcelDeviationReportAsync(
            request,
            request.WorkplaceId,
            _weldPassageRepository.GetAllDeviationsByWorkplaceAndDatePeriodAsync
        );
    }

    private async Task<Result<DocumentDto>> GenerateExcelDeviationReportAsync<T>(
        T request,
        Guid additionalId,
        Func<
            Guid,
            Guid,
            Guid?,
            DateTime,
            DateTime,
            Task<List<WeldPassageDeviationsDto>>
        > getAllDeviationsFunc
    )
        where T : GenerateExcelDeviationReportRequest
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

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

        return await _excelDeviationReportService.GenerateReportAsync(deviations);
    }
}
