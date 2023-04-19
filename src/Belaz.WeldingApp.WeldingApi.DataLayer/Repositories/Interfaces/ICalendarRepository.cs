using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ICalendarRepository
{
    Task<CalendarDto> CreateAsync(
        Calendar calendar,
        List<Day>? days,
        List<WorkingShift> workingShifts
    );

    Task<CalendarDto> UpdateAsync(Calendar calendar);

    Task<CalendarDto?> GetMainCalendarByYearAsync(int year);

    Task<CalendarDto?> GetByWelderIdAndYearAsync(Guid welderId, int year);

    Task<CalendarDto?> GetByEquipmentIdAndYearAsync(Guid weldingEquipmentId, int year);

    Task<CalendarDto> GetByIdAsync(Guid id);
}
