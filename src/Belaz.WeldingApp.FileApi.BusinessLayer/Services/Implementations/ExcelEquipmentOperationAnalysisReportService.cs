using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Models;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;
using Belaz.WeldingApp.FileApi.Domain.Enums;
using Belaz.WeldingApp.FileApi.Domain.Exceptions;
using Belaz.WeldingApp.FileApi.Domain.Extensions;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

internal class ExcelEquipmentOperationAnalysisReportService
    : IExcelEquipmentOperationAnalysisReportService
{
    private readonly IValidationService _validationService;

    private readonly IExcelFileService<DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>>
        _excelEquipmentOperationAnalysisReportService;

    private readonly ICalendarRepository _calendarRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IWorkshopRepository _workshopRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;
    private readonly IEquipmentConditionTimeService _conditionTimeService;
    private readonly ICalendarService _calendarService;

    public ExcelEquipmentOperationAnalysisReportService(
        IValidationService validationService,
        IExcelFileService<DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>>
            excelEquipmentOperationAnalysisReportService,
        ICalendarRepository calendarRepository,
        IWeldingEquipmentRepository weldingEquipmentRepository,
        IWorkshopRepository workshopRepository,
        IProductionAreaRepository productionAreaRepository,
        IEquipmentConditionTimeService conditionTimeService,
        ICalendarService calendarService)
    {
        _validationService = validationService;
        _excelEquipmentOperationAnalysisReportService =
            excelEquipmentOperationAnalysisReportService;
        _calendarRepository = calendarRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _workshopRepository = workshopRepository;
        _productionAreaRepository = productionAreaRepository;
        _conditionTimeService = conditionTimeService;
        _calendarService = calendarService;
    }

    public async Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportAsync(
        ExcelEquipmentOperationAnalysisReportRequest request
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
            .GetConditionTimeByDatePeriodAsync(
                dateStart,
                dateEnd
            );

        var data = await GetEquipmentOperationTimeByCutTypeAsync(
            conditionTimes,
            request.CutType,
            dateStart,
            dateEnd,
            request.WorkingShiftNumber,
            request.WithBreak
        );

        if (!data.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var result = new DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>
        {
            Data = data,
            TitleText = new[]
            {
                "Отчёт в разрезе завода",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentOperationAnalysisReportService.GenerateReportAsync(result);
    }

    public async Task<
        Result<DocumentDto>
    > GenerateExcelEquipmentOperationAnalysisReportByProductionAreaAsync(
        ExcelEquipmentOperationAnalysisReportByProductionAreaRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var conditionTimes =
            await _weldingEquipmentRepository.GetConditionTimeByProductionAreaAndDatePeriodAsync(
                request.ProductionAreaId,
                dateStart,
                dateEnd
            );

        var data = await GetEquipmentOperationTimeByCutTypeAsync(
            conditionTimes,
            request.CutType,
            dateStart,
            dateEnd,
            request.WorkingShiftNumber,
            request.WithBreak
        );

        if (!data.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var productionArea = await _productionAreaRepository.GetBriefInfoByIdAsync(request.ProductionAreaId);

        var result = new DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>
        {
            Data = data,
            TitleText = new[]
            {
                $"Отчёт в разрезе производственного участка: {productionArea.Number} {productionArea.Name}",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentOperationAnalysisReportService.GenerateReportAsync(result);
    }

    public async Task<
        Result<DocumentDto>
    > GenerateExcelEquipmentOperationAnalysisReportByWorkshopAsync(
        ExcelEquipmentOperationAnalysisReportByWorkshopRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<DocumentDto>(validationResult.Exception);
        }

        var dateStart = request.StartDate.ToDateTime();
        var dateEnd = request.EndDate.ToDateTime();

        var conditionTimes =
            await _weldingEquipmentRepository.GetConditionTimeByWorkshopAndDatePeriodAsync(
                request.WorkshopId,
                dateStart,
                dateEnd
            );

        var data = await GetEquipmentOperationTimeByCutTypeAsync(
            conditionTimes,
            request.CutType,
            dateStart,
            dateEnd,
            request.WorkingShiftNumber,
            request.WithBreak
        );

        if (!data.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        var workshop = await _workshopRepository.GetBriefInfoByIdAsync(request.WorkshopId);

        var result = new DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>
        {
            Data = data,
            TitleText = new[]
            {
                $"Отчёт в разрезе цеха: {workshop.Number} {workshop.Name}",
                $"За период {request.StartDate} - {request.EndDate}"
            }
        };

        return await _excelEquipmentOperationAnalysisReportService.GenerateReportAsync(result);
    }

    private async Task<
        List<EquipmentOperationTimeWithShiftDto>
    > GetEquipmentOperationTimeByCutTypeAsync(
        List<ConditionTimeDto> conditionTimes,
        CutType cutType,
        DateTime dateStart,
        DateTime dateEnd,
        int? chosenWorkingShiftNumber,
        bool withBreak = true
    )
    {
        var data = new List<EquipmentOperationTimeWithShiftDto>();

        switch (cutType)
        {
            case CutType.WorkingShift:
                data = await GetEquipmentOperationTimeForWorkingShiftAsync(
                    dateStart,
                    dateEnd,
                    conditionTimes,
                    chosenWorkingShiftNumber,
                    withBreak
                );
                break;
            case CutType.Day:
                data = await GetEquipmentOperationTimeForDays(dateStart, dateEnd, conditionTimes, withBreak);
                break;
            case CutType.Week:
                data = await GetEquipmentOperationTimeForWeeks(dateStart, dateEnd, conditionTimes, withBreak);
                break;
            case CutType.Mounth:
                data = await GetEquipmentOperationTimeForMonths(dateStart, dateEnd, conditionTimes, withBreak);
                break;
            case CutType.Year:
                data = await GetEquipmentOperationTimeForYears(dateStart, dateEnd, conditionTimes, withBreak);
                break;
        }

        return data;
    }

    private async Task<List<EquipmentOperationTimeWithShiftDto>> GetEquipmentOperationTimeForYears(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes,
        bool withBreak
    )
    {
        var result = new List<EquipmentOperationTimeWithShiftDto>();

        var yearStartDate = new DateTime(startDate.Year, 1, 1);
        var yearEndDate = new DateTime(endDate.Year, 1, 1);

        for (DateTime date = yearStartDate; date <= yearEndDate; date = date.AddYears(1))
        {
            var nextYearDate = date.AddYears(1);

            var yearConditionTimes = conditionTimes
                .Where(_ => _.Date.Date < nextYearDate.Date && _.Date.Date >= date.Date)
                .ToList();

            var allMinutes = await _calendarService
                .CalculateAllTimeMinutesByPeriodAsync(date, nextYearDate.AddDays(-1), withBreak);

            result.Add(
                _conditionTimeService.CalculateConditionTime(
                    yearConditionTimes,
                    allMinutes,
                    date.ToString("yyyy")
                )
            );
        }

        return result;
    }

    private async Task<List<EquipmentOperationTimeWithShiftDto>> GetEquipmentOperationTimeForMonths(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes,
        bool withBreak
    )
    {
        var result = new List<EquipmentOperationTimeWithShiftDto>();

        var monthStartDate = new DateTime(startDate.Year, startDate.Month, 1);
        var monthEndDate = new DateTime(endDate.Year, endDate.Month, 1);

        for (DateTime date = monthStartDate; date <= monthEndDate; date = date.AddMonths(1))
        {
            var nextMonthDate = date.AddMonths(1);

            var monthConditionTimes = conditionTimes
                .Where(_ => _.Date.Date < nextMonthDate.Date && _.Date.Date >= date.Date)
                .ToList();

            var allMinutes = await _calendarService
                .CalculateAllTimeMinutesByPeriodAsync(date, nextMonthDate.AddDays(-1), withBreak);

            result.Add(
                _conditionTimeService.CalculateConditionTime(
                    monthConditionTimes,
                    allMinutes,
                    date.ToString("MMMM yyyy")
                )
            );
        }

        return result;
    }

    private async Task<List<EquipmentOperationTimeWithShiftDto>> GetEquipmentOperationTimeForWeeks(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes,
        bool withBreak
    )
    {
        var result = new List<EquipmentOperationTimeWithShiftDto>();

        var weekStartDate = GetNearestDayOfWeek(startDate, DayOfWeek.Monday);
        var weekEndDate = GetNearestDayOfWeek(endDate, DayOfWeek.Sunday);

        for (var date = weekStartDate; date <= weekEndDate; date = date.AddDays(7))
        {
            var nextWeekDate = date.AddDays(6);

            var weekConditionTimes = conditionTimes
                .Where(_ => _.Date.Date <= nextWeekDate.Date && _.Date.Date >= date.Date)
                .ToList();

            var allMinutes = await _calendarService
                .CalculateAllTimeMinutesByPeriodAsync(date, nextWeekDate, withBreak);

            result.Add(
                _conditionTimeService.CalculateConditionTime(
                    weekConditionTimes,
                    allMinutes,
                    $"{date.ToString("MMMM dd")} - {nextWeekDate.ToString("MMMM dd")}"
                )
            );
        }

        return result;
    }

    private async Task<List<EquipmentOperationTimeWithShiftDto>> GetEquipmentOperationTimeForDays(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes,
        bool withBreak = true)
    {
        var result = new List<EquipmentOperationTimeWithShiftDto>();

        for (var date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var allMinutes = await _calendarService
                .CalculateAllTimeMinutesByPeriodAsync(date, date, withBreak);
            var dayConditionTimes = conditionTimes.Where(_ => _.Date.Date == date.Date).ToList();

            result.Add(_conditionTimeService
                .CalculateConditionTime(dayConditionTimes, allMinutes, date.ToString("MMMM dd"))
            );
        }

        return result;
    }

    private async Task<
        List<EquipmentOperationTimeWithShiftDto>
    > GetEquipmentOperationTimeForWorkingShiftAsync(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes,
        int? chosenWorkingShiftNumber,
        bool withBreak
    )
    {
        var calendar = await GetCalendarAsync(startDate);
        if (calendar == null)
        {
            return new List<EquipmentOperationTimeWithShiftDto>();
        }

        var mainWorkingShifts = calendar.MainWorkingShifts;
        var days = calendar.Days;

        var workingShiftConditionTimeMap = new Dictionary<int, List<ConditionTimeDto>>();

        foreach (var mainWorkingShift in mainWorkingShifts)
        {
            workingShiftConditionTimeMap[mainWorkingShift.Number] = new List<ConditionTimeDto>();
        }

        foreach (var conditionTime in conditionTimes)
        {
            var workingShiftNumber = _conditionTimeService.GetWorkingShiftNumberForConditionTime(
                conditionTime,
                days!,
                mainWorkingShifts
            );

            if (workingShiftNumber is not null)
            {
                workingShiftConditionTimeMap[(int)workingShiftNumber].Add(conditionTime);
            }
        }

        var result = new List<EquipmentOperationTimeWithShiftDto>();

        var keyValuePairWorkingShiftConditionTime = chosenWorkingShiftNumber.HasValue
            ? workingShiftConditionTimeMap
                .Where(_ => _.Key == chosenWorkingShiftNumber.Value)
                .OrderBy(_ => _.Key)
            : workingShiftConditionTimeMap
                .OrderBy(_ => _.Key);

        foreach (var kvp in keyValuePairWorkingShiftConditionTime)
        {
            var workingShiftConditionTimes = kvp.Value;

            result.Add(
                GetEquipmentOperationTimeWithShift(
                    kvp.Key,
                    workingShiftConditionTimes,
                    startDate,
                    endDate,
                    days!,
                    mainWorkingShifts,
                    withBreak
                )
            );
        }

        return result;
    }

    private Task<CalendarDto?> GetCalendarAsync(DateTime date)
    {
        var year = date.Year;
        var calendar = _calendarRepository.GetMainCalendarByYearAsync(year);
        return calendar;
    }

    private EquipmentOperationTimeWithShiftDto GetEquipmentOperationTimeWithShift(
        int workingShiftNumber,
        List<ConditionTimeDto> workingShiftConditionTimes,
        DateTime startDate,
        DateTime endDate,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts,
        bool withBreak
    )
    {
        var allMinutes = _conditionTimeService.GetWorkingShiftAllMinutesByDateTimeDuration(
            workingShiftNumber,
            startDate,
            endDate,
            days!,
            mainWorkingShifts,
            withBreak);

        return _conditionTimeService.CalculateConditionTime(
            workingShiftConditionTimes,
            allMinutes,
            $"Смена {workingShiftNumber}"
        );
    }

    private DateTime GetNearestDayOfWeek(DateTime dateTime, DayOfWeek dayOfWeek)
    {
        while (dateTime.DayOfWeek != dayOfWeek)
        {
            dateTime = dateTime.AddDays(dateTime.DayOfWeek < dayOfWeek ? 1 : -1);
        }

        return dateTime;
    }
}