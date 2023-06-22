using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Services.Interfaces;

public interface ICalendarService
{
    Task<double> CalculateAllTimeMinutesByPeriodAsync(DateTime startDate, DateTime endDate, bool withBreak = true);

    Task<double> CalculateAllTimeMinutesByPeriodForWelderAsync(
        DateTime startDate, DateTime endDate,
        Guid? welderId,
        bool withBreak = true);

    Task<double> CalculateAllTimeMinutesByPeriodForEquipmentAsync(
        DateTime startDate, DateTime endDate,
        Guid? equipmentId,
        bool withBreak = true);

    TimeSpan CalculateWorkingShiftDuration(WorkingShiftDto workingShift, bool withBreak);
}