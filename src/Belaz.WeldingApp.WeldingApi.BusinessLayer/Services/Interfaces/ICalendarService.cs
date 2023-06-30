using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface ICalendarService
{
    Task<BaseResultRequest<CalendarDto>> CreateAsync(CreateCalendarRequest request, bool isMain);

    Task<BaseResultRequest<CalendarDto>> CreateForEquipmentAsync(CreateCalendarWithEquipmentIdRequest request);

    Task<BaseResultRequest<CalendarDto>> CreateForWelderAsync(CreateCalendarWithWelderIdRequest request);

    Task<BaseResultRequest<CalendarDto>> UpdateAsync(UpdateCalendarRequest request);

    Task<BaseResultRequest<CalendarDto?>> GetMainCalendarByYearAsync(GetMainCalendarByYearRequest request);

    Task<BaseResultRequest<CalendarDto?>> GetByWelderIdAndYearAsync(GetByWelderIdRequest request);

    Task<BaseResultRequest<CalendarDto?>> GetByEquipmentIdAndYearAsync(GetByEquipmentIdRequest request);

    Task<BaseRequest<int[]>> GetAllExistedMainYearAsync();

    Task<BaseResultRequest<int[]>> GetAllExistedYearByWelderIdAsync(GetAllExistedYearByWelderIdRequest request);

    Task<BaseResultRequest<int[]>> GetAllExistedYearByEquipmentIdAsync(GetAllExistedYearByEquipmentIdRequest request);

    Task<BaseResultRequest<CalendarDto>> CreateMainCalendarByYearAsync(CreateMainCalendarByYearRequest request);

    Task<BaseResultRequest<CalendarDto>> CreateWelderCalendarBasedOnMainAsync(
        CreateWelderCalendarBasedOnMainRequest request);

    Task<BaseResultRequest<CalendarDto>> CreateEquipmentCalendarBasedOnMainAsync(
        CreateEquipmentCalendarBasedOnMainRequest request);
}