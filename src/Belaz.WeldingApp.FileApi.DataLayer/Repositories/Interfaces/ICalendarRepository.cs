using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface ICalendarRepository
{
    Task<CalendarDto?> GetMainCalendarByYearAsync(int year);

    Task<List<CalendarDto>>
        GetCalendarsForWeldingEquipmentsByYearAsync(IEnumerable<Guid> weldingEquipmentIds, int year);
}