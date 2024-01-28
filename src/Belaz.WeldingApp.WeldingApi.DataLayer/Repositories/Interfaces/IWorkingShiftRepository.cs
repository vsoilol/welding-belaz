using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWorkingShiftRepository
{
    Task<WorkingShiftDto> UpdateAsync(WorkingShift entity);

    Task<WorkingShiftDto> CreateAsync(WorkingShift entity);
    
    Task<List<WorkingShiftDto>> GetAllMainWorkingShiftsByYearAsync(int year);
    
    Task<List<WorkingShiftDto>> GetAllWorkingShiftsByWelderIdAndYearAsync(int year, Guid welderId);
    
    Task<List<WorkingShiftDto>> GetAllWorkingShiftsByEquipmentIdAndYearAsync(int year, Guid equipmentId);

    Task<WorkingShiftDto> GetByIdAsync(Guid id);
    
    Task DeleteByIdAsync(Guid id);
}
