using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class EquipmentConditionTimeService : IEquipmentConditionTimeService
{
    private readonly ICalendarService _calendarService;

    public EquipmentConditionTimeService(ICalendarService calendarService)
    {
        _calendarService = calendarService;
    }

    public double GetWorkingShiftAllMinutesByDateTimeDuration(int workingShiftNumber,
        DateTime startDate,
        DateTime endDate,
        List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts,
        bool withBreak = true)
    {
        var allMinutes = 0.0;

        for (var date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var day = days?.FirstOrDefault(
                _ => _.MonthNumber == date.Month && _.Number == date.Day
            );

            var workingShift = mainWorkingShifts.FirstOrDefault(
                _ => _.Number == workingShiftNumber
            )!;

            var duration = GetWorkingShiftDuration(workingShift, day, withBreak);

            allMinutes += duration.TotalMinutes;
        }

        return allMinutes;
    }

    public int? GetWorkingShiftNumberForConditionTime(ConditionTimeDto conditionTime, List<DayDto> days,
        List<WorkingShiftDto> mainWorkingShifts)
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

    public EquipmentOperationTimeWithShiftDto CalculateConditionTime(List<ConditionTimeDto> conditionTimes,
        double allMinutes, string text)
    {
        if (allMinutes == 0)
        {
            return new EquipmentOperationTimeWithShiftDto
            {
                CutInfo = text,
                OnTimeMinutes = 0,
                WorkTimeMinutes = 0,
                DowntimeMinutes = 0,
                OffTimeMinutes = 0
            };
        }

        var conditionTimeGroups = conditionTimes
            .GroupBy(w => w.Condition)
            .Select(g => new { Condition = g.Key, Time = g.Sum(w => w.Time) })
            .ToList();

        var onTimeMinutes = conditionTimeGroups
            .FirstOrDefault(g => g.Condition == Condition.On)?.Time ?? 0;
        var workTimeMinutes = conditionTimeGroups
            .FirstOrDefault(g => g.Condition == Condition.AtWork)?.Time ?? 0;
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

    private TimeSpan GetWorkingShiftDuration(WorkingShiftDto workingShift, DayDto? day, bool withBreak)
    {
        if (IsWorkingDay(day))
        {
            var dayWorkingShift = day!.WorkingShifts!.FirstOrDefault(
                _ => _.Number == workingShift.Number
            );

            return _calendarService.CalculateWorkingShiftDuration(dayWorkingShift!, withBreak);
        }

        if (IsWeekend(day))
        {
            return TimeSpan.Zero;
        }

        return _calendarService.CalculateWorkingShiftDuration(workingShift, withBreak);
    }

    private bool IsWorkingDay(DayDto? day)
    {
        return day is not null && day.IsWorkingDay;
    }

    private bool IsWeekend(DayDto? day)
    {
        return day is not null && !day.IsWorkingDay;
    }
}