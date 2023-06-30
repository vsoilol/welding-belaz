using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IDayService
{
    Task<BaseResultRequest<DayDto>> CreateAsync(CreateDayWithYearRequest request);
    
    Task<BaseRequest<List<DayDto>>> GetAllMainAsync();
    
    Task<BaseResultRequest<List<DayDto>>> GetAllByWelderIdAsync(GetDaysByWelderIdRequest request);
    
    Task<BaseResultRequest<List<DayDto>>> GetAllByEquipmentIdAsync(GetDaysByEquipmentIdRequest request);
    
    Task<BaseResultRequest<DayDto>> UpdateAsync(UpdateDayRequest request);
    
    Task<BaseResultRequest<Unit>> DeleteDayAsync(DeleteDayRequest request);
}