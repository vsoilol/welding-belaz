using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ICalendarManager
{
    Task<CalendarDto?> CreateAsync(CreateCalendarRequest request, bool isMain);
    
    Task UpdateAsync(UpdateCalendarRequest request);
    
    Task<CalendarDto?> GetMainCalendarByYearAsync(int year);
}