using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWorkingShiftRepository
{
    Task<WorkingShiftDto> UpdateAsync(WorkingShift entity);

    Task<WorkingShiftDto> CreateAsync(WorkingShift entity, int? year);

    Task<WorkingShiftDto> GetByIdAsync(Guid id);
}
