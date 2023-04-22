using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.BusinessLayer.ExcelFileServices.Interfaces;
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
    private readonly IExcelFileService<
        List<EquipmentOperationTimeWithShiftDto>
    > _excelEquipmentOperationAnalysisReportService;
    private readonly ICalendarRepository _calendarRepository;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;

    public ExcelEquipmentOperationAnalysisReportService(
        IValidationService validationService,
        IExcelFileService<
            List<EquipmentOperationTimeWithShiftDto>
        > excelEquipmentOperationAnalysisReportService,
        ICalendarRepository calendarRepository,
        IWeldingEquipmentRepository weldingEquipmentRepository
    )
    {
        _validationService = validationService;
        _excelEquipmentOperationAnalysisReportService =
            excelEquipmentOperationAnalysisReportService;
        _calendarRepository = calendarRepository;
        _weldingEquipmentRepository = weldingEquipmentRepository;
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

        List<EquipmentOperationTimeWithShiftDto> data =
            new List<EquipmentOperationTimeWithShiftDto>();

        switch (request.CutType)
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
        }

        if (!data.Any())
        {
            var exception = new ListIsEmptyException();
            return new Result<DocumentDto>(exception);
        }

        return await _excelEquipmentOperationAnalysisReportService.GenerateReportAsync(data);
    }

    public Task<
        Result<DocumentDto>
    > GenerateExcelEquipmentOperationAnalysisReportByProductionAreaAsync(
        ExcelEquipmentOperationAnalysisReportByProductionAreaRequest request
    )
    {
        throw new NotImplementedException();
    }

    public Task<Result<DocumentDto>> GenerateExcelEquipmentOperationAnalysisReportByWorkshopAsync(
        ExcelEquipmentOperationAnalysisReportByWorkshopRequest request
    )
    {
        throw new NotImplementedException();
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

            var dayConditionTimes = conditionTimes
                .Where(_ => _.Date.Date <= nextWeekDate.Date && _.Date.Date >= date.Date)
                .ToList();

            var conditionTimeGroups = dayConditionTimes
                .GroupBy(w => w.Condition)
                .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
                .ToList();

            var allMinutes = WeekMinutes;

            var onTimeMinutes =
                conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.On)?.Time ?? 0;
            var workTimeMinutes =
                conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.AtWork)?.Time ?? 0;
            var downtimeMinutes =
                conditionTimeGroups
                    .FirstOrDefault(g => g.Condition == Condition.ForcedDowntime)
                    ?.Time ?? 0;

            var offTimeMinutes = allMinutes - downtimeMinutes - workTimeMinutes - onTimeMinutes;

            result.Add(
                new EquipmentOperationTimeWithShiftDto
                {
                    CutInfo = $"{date.ToString("MMMM dd")} - {nextWeekDate.ToString("MMMM dd")}",
                    OnTimeMinutes = onTimeMinutes,
                    WorkTimeMinutes = workTimeMinutes,
                    DowntimeMinutes = downtimeMinutes,
                    OffTimeMinutes = offTimeMinutes
                }
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

            var conditionTimeGroups = dayConditionTimes
                .GroupBy(w => w.Condition)
                .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
                .ToList();

            var allMinutes = DayMinutes;

            var onTimeMinutes =
                conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.On)?.Time ?? 0;
            var workTimeMinutes =
                conditionTimeGroups.FirstOrDefault(g => g.Condition == Condition.AtWork)?.Time ?? 0;
            var downtimeMinutes =
                conditionTimeGroups
                    .FirstOrDefault(g => g.Condition == Condition.ForcedDowntime)
                    ?.Time ?? 0;

            var offTimeMinutes = allMinutes - downtimeMinutes - workTimeMinutes - onTimeMinutes;

            result.Add(
                new EquipmentOperationTimeWithShiftDto
                {
                    CutInfo = date.ToString("MMMM dd"),
                    OnTimeMinutes = onTimeMinutes,
                    WorkTimeMinutes = workTimeMinutes,
                    DowntimeMinutes = downtimeMinutes,
                    OffTimeMinutes = offTimeMinutes
                }
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

            return dayWorkingShift!.ShiftEnd - dayWorkingShift.ShiftStart;
        }

        if (IsWeekend(day))
        {
            return TimeSpan.Zero;
        }

        if (workingShift.ShiftEnd.Hours == 0)
        {
            return new TimeSpan(24, workingShift.ShiftEnd.Minutes, 0) - workingShift.ShiftStart;
        }

        return workingShift.ShiftEnd - workingShift.ShiftStart;
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
        var conditionTimeGroups = workingShiftConditionTimes
            .GroupBy(w => w.Condition)
            .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
            .ToList();

        var allMinutes = GetWorkingShiftAllMinutesByDateTimeDuration(
            workingShiftNumber,
            startDate,
            endDate,
            days!,
            mainWorkingShifts
        );

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
            CutInfo = $"Смена {workingShiftNumber}",
            OnTimeMinutes = onTimeMinutes,
            WorkTimeMinutes = workTimeMinutes,
            DowntimeMinutes = downtimeMinutes,
            OffTimeMinutes = offTimeMinutes
        };
    }

    public static DateTime GetNearestDayOfWeek(DateTime dateTime, DayOfWeek dayOfWeek)
    {
        while (dateTime.DayOfWeek != dayOfWeek)
        {
            dateTime = dateTime.AddDays(dateTime.DayOfWeek < dayOfWeek ? 1 : -1);
        }
        return dateTime;
    }
}
