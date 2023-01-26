using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ICalendarService
{
    Task<Result<CalendarDto>> CreateAsync(CreateCalendarRequest request, bool isMain);
    
    Task<Result<CalendarDto>> CreateForEquipmentAsync(CreateCalendarWithEquipmentIdRequest request);
    
    Task<Result<CalendarDto>> CreateForWelderAsync(CreateCalendarWithWelderIdRequest request);
    
    Task<Result<CalendarDto>> UpdateAsync(UpdateCalendarRequest request);
    
    Task<Result<CalendarDto?>> GetMainCalendarByYearAsync(GetMainCalendarByYearRequest request);

    Task<Result<CalendarDto?>> GetByWelderIdAndYearAsync(GetByWelderIdRequest request);
    
    Task<Result<CalendarDto?>> GetByEquipmentIdAndYearAsync(GetByEquipmentIdRequest request);
}