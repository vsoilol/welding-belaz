using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IDayService
{
    Task<DayDto?> CreateAsync(CreateDayWithYearRequest request);
    
    Task<List<DayDto>> GetAllMainAsync();
    
    Task<List<DayDto>> GetAllByWelderIdAsync(Guid welderId);
    
    Task<List<DayDto>> GetAllByEquipmentIdAsync(Guid equipmentId);
    
    Task<DayDto?> UpdateAsync(UpdateDayRequest request);
    
    Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId);
}