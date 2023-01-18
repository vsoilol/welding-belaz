using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface ICalendarManager
{
    Task<CalendarDto?> CreateAsync(CreateCalendarRequest request, bool isMain);
    
    Task<CalendarDto?> UpdateAsync(UpdateCalendarRequest request);
    
    Task<CalendarDto?> GetMainCalendarByYearAsync(int year);
    
    Task<CalendarDto?> CreateAsync(CreateCalendarWithWelderIdRequest request);
    
    Task<CalendarDto?> GetByWelderIdAsync(GetByWelderIdRequest request);
    
    Task<CalendarDto?> CreateAsync(CreateCalendarWithEquipmentIdRequest request);
    
    Task<CalendarDto?> GetByEquipmentIdAsync(GetByEquipmentIdRequest request);
}