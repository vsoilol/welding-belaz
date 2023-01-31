using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWorkingShiftRepository
{
    Task<WorkingShiftDto> UpdateAsync(WorkingShift entity);
    
    Task<WorkingShiftDto> CreateAsync(WorkingShift entity);
    
    Task<WorkingShiftDto> GetByIdAsync(Guid id);
}