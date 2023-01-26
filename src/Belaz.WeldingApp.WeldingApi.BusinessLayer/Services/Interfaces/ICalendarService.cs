using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ICalendarService
{
    Task<CalendarDto?> CreateAsync(CreateCalendarRequest request, bool isMain);
    
    Task<CalendarDto?> UpdateAsync(UpdateCalendarRequest request);
    
    Task<CalendarDto?> GetMainCalendarByYearAsync(int year);
    
    Task<CalendarDto?> CreateAsync(CreateCalendarWithWelderIdRequest request);
    
    Task<CalendarDto?> GetByWelderIdAsync(GetByWelderIdRequest request);
    
    Task<CalendarDto?> CreateAsync(CreateCalendarWithEquipmentIdRequest request);
    
    Task<CalendarDto?> GetByEquipmentIdAsync(GetByEquipmentIdRequest request);
}