using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IDayRepository
{
    Task<List<DayDto>> GetAllMainAsync();

    Task<List<DayDto>> GetAllByWelderIdAsync(Guid welderId);

    Task<List<DayDto>> GetAllByEquipmentIdAsync(Guid equipmentId);

    Task<DayDto> UpdateAsync(Day day);

    Task<bool> UpdateRangeAsync(IEnumerable<Day> days);
    
    Task<DayDto> CreateAsync(Day day, int year, Guid? weldingEquipmentId, Guid? welderId);
    
    Task<DayDto> GetByIdAsync(Guid id);
    
    Task AddRangeAsync(IEnumerable<Day> workingShifts);
}