using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class ExcelEquipmentOperationTimeReportService : IExcelEquipmentOperationTimeReportService
{
    private readonly IValidationService _validationService;

    private readonly IExcelFileService<DocumentInfo<EquipmentOperationTimeWithShiftDto>>
        _excelEquipmentOperationTimeReportService;

    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly ICalendarService _calendarService;
    private readonly IEquipmentConditionTimeService _conditionTimeService;

    public ExcelEquipmentOperationTimeReportService(
        IValidationService validationService,
        IExcelFileService<DocumentInfo<EquipmentOperationTimeWithShiftDto>> excelEquipmentOperationTimeReportService,
        IWeldingEquipmentRepository weldingEquipmentRepository, ICalendarService calendarService,
        IEquipmentConditionTimeService conditionTimeService)
    {
        _validationService = validationService;
        _excelEquipmentOperationTimeReportService = excelEquipmentOperationTimeReportService;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _calendarService = calendarService;
        _conditionTimeService = conditionTimeService;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentOperationTimeReportAsync(
        GenerateExcelEquipmentOperationTimeReportRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var conditionTimes = await _weldingEquipmentRepository
            .GetEquipmentConditionTimeByIdAndDatePeriodAsync(
                request.WeldingEquipmentId,
                dateStart,
                dateEnd);

        var allMinutes = await _calendarService
            .CalculateAllTimeMinutesByPeriodForEquipmentAsync(dateStart, dateEnd, request.WeldingEquipmentId,
                request.WithBreak);

        var data = _conditionTimeService
            .CalculateConditionTime(conditionTimes, allMinutes);

        var weldingEquipment = await _weldingEquipmentRepository.GetBriefInfoByIdAsync(request.WeldingEquipmentId);

        var result = new DocumentInfo<EquipmentOperationTimeWithShiftDto>
        {
            Data = data,
            TitleText = new[]
            {
                $"Для оборудования: {weldingEquipment.FactoryNumber} {weldingEquipment.Name}",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentOperationTimeReportService.GenerateReportAsync(result);
    }
}