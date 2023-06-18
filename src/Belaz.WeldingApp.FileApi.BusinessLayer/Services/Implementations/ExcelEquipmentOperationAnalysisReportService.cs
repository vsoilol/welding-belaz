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
    private const int DayMinutes = 1440;
    private const int WeekMinutes = 10080;

    private readonly IValidationService _validationService;

    private readonly IExcelFileService<DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>>
        _excelEquipmentOperationAnalysisReportService;

    private readonly ICalendarRepository _calendarRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;
    private readonly IWorkshopRepository _workshopRepository;
    private readonly IProductionAreaRepository _productionAreaRepository;

    public ExcelEquipmentOperationAnalysisReportService(
        IValidationService validationService,
        IExcelFileService<DocumentInfo<List<EquipmentOperationTimeWithShiftDto>>>
            excelEquipmentOperationAnalysisReportService,
        ICalendarRepository calendarRepository,
        IWeldingEquipmentRepository weldingEquipmentRepository, IWorkshopRepository workshopRepository,
        IProductionAreaRepository productionAreaRepository)
    {
        _validationService = validationService;
        _excelEquipmentOperationAnalysisReportService =
            excelEquipmentOperationAnalysisReportService;
        _calendarRepository = calendarRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
        _workshopRepository = workshopRepository;
        _productionAreaRepository = productionAreaRepository;
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

        var conditionTimes = await _weldingEquipmentRepository.GetConditionTimeByDatePeriodAsync(
            dateStart,
            dateEnd
        );

        var data = await GetEquipmentOperationTimeByCutTypeAsync(
            conditionTimes,
            request.CutType,
            dateStart,
            dateEnd
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
            dateEnd
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
            dateEnd
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
        DateTime dateEnd
    )
    {
        var data = new List<EquipmentOperationTimeWithShiftDto>();

        switch (cutType)
        {
            case CutType.WorkingShift:
                data = await GetEquipmentOperationTimeForWorkingShiftAsync(
                    dateStart,
                    dateEnd,
                    conditionTimes
                );
                break;
            case CutType.Day:
                data = GetEquipmentOperationTimeForDays(dateStart, dateEnd, conditionTimes);
                break;
            case CutType.Week:
                data = GetEquipmentOperationTimeForWeeks(dateStart, dateEnd, conditionTimes);
                break;
            case CutType.Mounth:
                data = GetEquipmentOperationTimeForMonths(dateStart, dateEnd, conditionTimes);
                break;
            case CutType.Year:
                data = GetEquipmentOperationTimeForYears(dateStart, dateEnd, conditionTimes);
                break;
        }

        return data;
    }

    private List<EquipmentOperationTimeWithShiftDto> GetEquipmentOperationTimeForYears(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes
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

            int year = date.Year;

            DateTime start = new DateTime(year, 1, 1);
            DateTime end = new DateTime(year + 1, 1, 1);

            TimeSpan duration = end - start;

            result.Add(
                CalculateConditionTime(
                    yearConditionTimes,
                    duration.TotalMinutes,
                    date.ToString("yyyy")
                )
            );
        }

        return result;
    }

    private List<EquipmentOperationTimeWithShiftDto> GetEquipmentOperationTimeForMonths(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes
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

            int daysInMonth = DateTime.DaysInMonth(date.Year, date.Month);
            int totalMinutesInMonth = daysInMonth * 1440;

            result.Add(
                CalculateConditionTime(
                    monthConditionTimes,
                    totalMinutesInMonth,
                    date.ToString("MMMM yyyy")
                )
            );
        }

        return result;
    }

    private List<EquipmentOperationTimeWithShiftDto> GetEquipmentOperationTimeForWeeks(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes
    )
    {
        var result = new List<EquipmentOperationTimeWithShiftDto>();

        var weekStartDate = GetNearestDayOfWeek(startDate, DayOfWeek.Monday);
        var weekEndDate = GetNearestDayOfWeek(endDate, DayOfWeek.Sunday);

        for (DateTime date = weekStartDate; date <= weekEndDate; date = date.AddDays(7))
        {
            var nextWeekDate = date.AddDays(6);

            var weekConditionTimes = conditionTimes
                .Where(_ => _.Date.Date <= nextWeekDate.Date && _.Date.Date >= date.Date)
                .ToList();

            result.Add(
                CalculateConditionTime(
                    weekConditionTimes,
                    WeekMinutes,
                    $"{date.ToString("MMMM dd")} - {nextWeekDate.ToString("MMMM dd")}"
                )
            );
        }

        return result;
    }

    private List<EquipmentOperationTimeWithShiftDto> GetEquipmentOperationTimeForDays(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes
    )
    {
        var result = new List<EquipmentOperationTimeWithShiftDto>();

        for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var dayConditionTimes = conditionTimes.Where(_ => _.Date.Date == date.Date).ToList();

            result.Add(
                CalculateConditionTime(dayConditionTimes, DayMinutes, date.ToString("MMMM dd"))
            );
        }

        return result;
    }

    private async Task<
        List<EquipmentOperationTimeWithShiftDto>
    > GetEquipmentOperationTimeForWorkingShiftAsync(
        DateTime startDate,
        DateTime endDate,
        List<ConditionTimeDto> conditionTimes
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
            var workingShiftNumber = GetWorkingShiftNumberForConditionTime(
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

        foreach (var kvp in workingShiftConditionTimeMap.OrderBy(_ => _.Key))
        {
            var workingShiftConditionTimes = kvp.Value;

            result.Add(
                GetEquipmentOperationTimeWithShift(
                    kvp.Key,
                    workingShiftConditionTimes,
                    startDate,
                    endDate,
                    days!,
                    mainWorkingShifts
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

    private bool IsWorkingDay(DayDto? day)
    {
        return day is not null && day.IsWorkingDay;
    }

    private bool IsWeekend(DayDto? day)
    {
        return day is not null && !day.IsWorkingDay;
    }

    private TimeSpan GetWorkingShiftDuration(WorkingShiftDto workingShift, DayDto? day)
    {
        if (IsWorkingDay(day))
        {
            var dayWorkingShift = day!.WorkingShifts!.FirstOrDefault(
                _ => _.Number == workingShift.Number
            );

            return CalculateWorkingShiftDuration(dayWorkingShift!);
        }

        if (IsWeekend(day))
        {
            return TimeSpan.Zero;
        }

        return CalculateWorkingShiftDuration(workingShift);
    }

    private TimeSpan CalculateWorkingShiftDuration(WorkingShiftDto workingShift)
    {
        var breakEnd = workingShift.BreakEnd!.Value.Hours == 0
            ? new TimeSpan(24, workingShift.BreakEnd!.Value.Minutes, 0)
            : workingShift.BreakEnd!.Value;
        var workingShiftEnd = workingShift.ShiftEnd.Hours == 0
            ? new TimeSpan(24, workingShift.ShiftEnd.Minutes, 0)
            : workingShift.ShiftEnd;

        var mainBreakDuration = breakEnd - workingShift.BreakStart!.Value;
        var workingShiftDuration = workingShiftEnd - workingShift.ShiftStart;

        return workingShiftDuration - mainBreakDuration;
    }

    private int? GetWorkingShiftNumberForConditionTime(
        ConditionTimeDto conditionTime,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts
    )
    {
        var day = days?.FirstOrDefault(
            _ => _.MonthNumber == conditionTime.Date.Month && _.Number == conditionTime.Date.Day
        );

        if (IsWorkingDay(day))
        {
            var dayWorkingShift = day!.WorkingShifts!.FirstOrDefault(
                _ =>
                    conditionTime.StartConditionTime >= _.ShiftStart
                    && conditionTime.StartConditionTime <= _.ShiftEnd
            );

            return dayWorkingShift?.Number;
        }

        if (IsWeekend(day))
        {
            return null;
        }

        var workingShift = mainWorkingShifts.FirstOrDefault(
            _ =>
                conditionTime.StartConditionTime >= _.ShiftStart
                && conditionTime.StartConditionTime <= _.ShiftEnd
        );

        return workingShift?.Number;
    }

    private double GetWorkingShiftAllMinutesByDateTimeDuration(
        int workingShiftNumber,
        DateTime startDate,
        DateTime endDate,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts
    )
    {
        var allMinutes = 0.0;

        for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var day = days?.FirstOrDefault(
                _ => _.MonthNumber == date.Month && _.Number == date.Day
            );

            var workingShift = mainWorkingShifts.FirstOrDefault(
                _ => _.Number == workingShiftNumber
            )!;

            var duration = GetWorkingShiftDuration(workingShift, day);

            allMinutes += duration.TotalMinutes;
        }

        return allMinutes;
    }

    private EquipmentOperationTimeWithShiftDto GetEquipmentOperationTimeWithShift(
        int workingShiftNumber,
        List<ConditionTimeDto> workingShiftConditionTimes,
        DateTime startDate,
        DateTime endDate,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts
    )
    {
        var allMinutes = GetWorkingShiftAllMinutesByDateTimeDuration(
            workingShiftNumber,
            startDate,
            endDate,
            days!,
            mainWorkingShifts
        );

        return CalculateConditionTime(
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

    private EquipmentOperationTimeWithShiftDto CalculateConditionTime(
        List<ConditionTimeDto> conditionTimes,
        double allMinutes,
        string text
    )
    {
        var conditionTimeGroups = conditionTimes
            .GroupBy(w => w.Condition)
            .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
            .ToList();

        var onTimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.On)?.Time ?? 0;
        var workTimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.AtWork)?.Time ?? 0;
        var downtimeMinutes =
            conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.ForcedDowntime)?.Time
            ?? 0;

        var offTimeMinutes = allMinutes - downtimeMinutes - workTimeMinutes - onTimeMinutes;

        return new EquipmentOperationTimeWithShiftDto
        {
            CutInfo = text,
            OnTimeMinutes = onTimeMinutes,
            WorkTimeMinutes = workTimeMinutes,
            DowntimeMinutes = downtimeMinutes,
            OffTimeMinutes = offTimeMinutes
        };
    }
}