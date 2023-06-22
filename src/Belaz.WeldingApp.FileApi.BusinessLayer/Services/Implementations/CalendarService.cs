using Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Implementations;

public class CalendarService : ICalendarService
{
    private readonly ICalendarRepository _calendarRepository;
    private readonly IDayRepository _dayRepository;
    private readonly IWorkingShiftRepository _workingShiftRepository;

    public CalendarService(ICalendarRepository calendarRepository,
        IDayRepository dayRepository,
        IWorkingShiftRepository workingShiftRepository)
    {
        _calendarRepository = calendarRepository;
        _dayRepository = dayRepository;
        _workingShiftRepository = workingShiftRepository;
    }

    public async Task<double> CalculateAllTimeMinutesByPeriodAsync(DateTime startDate, DateTime endDate,
        bool withBreak = true)
    {
        var days = await _dayRepository.GetAllDaysByDatePeriodAsync(startDate, endDate);
        var workingShifts = await _workingShiftRepository
            .GetWorkingShiftsByDatePeriodAsync(startDate, endDate);

        return CalculateAllTimeMinutesByDaysAsync(startDate, endDate, days, workingShifts, withBreak);
    }

    public async Task<double> CalculateAllTimeMinutesByPeriodForWelderAsync(DateTime startDate, DateTime endDate,
        Guid? welderId,
        bool withBreak = true)
    {
        var days = await _dayRepository.GetAllDaysByDatePeriodForWelderAsync(startDate, endDate, welderId);
        var workingShifts = await _workingShiftRepository
            .GetWorkingShiftsByDatePeriodForWelderAsync(startDate, endDate, welderId);

        return CalculateAllTimeMinutesByDaysAsync(startDate, endDate, days, workingShifts, withBreak);
    }

    public async Task<double> CalculateAllTimeMinutesByPeriodForEquipmentAsync(DateTime startDate, DateTime endDate,
        Guid? equipmentId,
        bool withBreak = true)
    {
        var days = await _dayRepository.GetAllDaysByDatePeriodForEquipmentAsync(startDate, endDate, equipmentId);
        var workingShifts = await _workingShiftRepository
            .GetWorkingShiftsByDatePeriodForEquipmentAsync(startDate, endDate, equipmentId);

        return CalculateAllTimeMinutesByDaysAsync(startDate, endDate, days, workingShifts, withBreak);
    }

    private double CalculateAllTimeMinutesByDaysAsync(
        DateTime startDate, DateTime endDate,
        IReadOnlyCollection<DayDto> days,
        IReadOnlyCollection<WorkingShiftDto> mainWorkingShifts,
        bool withBreak = true)
    {
        var allMinutes = 0.0;

        for (var date = startDate; date <= endDate; date = date.AddDays(1))
        {
            var day = days?.FirstOrDefault(
                _ => _.MonthNumber == date.Month
                     && _.Number == date.Day
                     && _.Year == date.Year
            );

            var workingShifts = mainWorkingShifts
                .Where(_ => _.Year == date.Year)
                .ToList();

            var duration = GetWorkingShiftsDuration(day, workingShifts, withBreak);

            allMinutes += duration.TotalMinutes;
        }

        return allMinutes;
    }

    private TimeSpan GetWorkingShiftsDuration(DayDto? day,
        IReadOnlyCollection<WorkingShiftDto> mainWorkingShifts,
        bool withBreak)
    {
        if (IsWorkingDay(day))
        {
            var dayWorkingShifts = day!.WorkingShifts!;

            return CalculateWorkingShiftsDuration(dayWorkingShifts, withBreak);
        }

        if (IsWeekend(day))
        {
            return TimeSpan.Zero;
        }

        return CalculateWorkingShiftsDuration(mainWorkingShifts, withBreak);
    }

    public TimeSpan CalculateWorkingShiftDuration(WorkingShiftDto workingShift, bool withBreak)
    {
        var workingShiftEnd = workingShift.ShiftEnd.Hours == 0
            ? new TimeSpan(24, workingShift.ShiftEnd.Minutes, 0)
            : workingShift.ShiftEnd;

        var workingShiftDuration = workingShiftEnd - workingShift.ShiftStart;
        var resultDuration = workingShiftDuration;

        if (!withBreak)
        {
            var breakEnd = workingShift.BreakEnd!.Value.Hours == 0
                ? new TimeSpan(24, workingShift.BreakEnd!.Value.Minutes, 0)
                : workingShift.BreakEnd!.Value;

            var mainBreakDuration = breakEnd - workingShift.BreakStart!.Value;
            resultDuration -= mainBreakDuration;
        }

        return resultDuration;
    }

    private bool IsWorkingDay(DayDto? day)
    {
        return day is not null && day.IsWorkingDay;
    }

    private bool IsWeekend(DayDto? day)
    {
        return day is not null && !day.IsWorkingDay;
    }

    private TimeSpan CalculateWorkingShiftsDuration(IReadOnlyCollection<WorkingShiftDto> workingShifts, bool withBreak)
    {
        var result = new TimeSpan();

        foreach (var workingShift in workingShifts)
        {
            result += CalculateWorkingShiftDuration(workingShift, withBreak);
        }

        return result;
    }
}