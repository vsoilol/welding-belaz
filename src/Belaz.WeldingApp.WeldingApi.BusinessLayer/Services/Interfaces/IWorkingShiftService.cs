using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWorkingShiftService
{
    Task<WorkingShiftDto> CreateAsync(CreateWorkingShiftWithYearRequest request);
    
    Task<WorkingShiftDto> UpdateAsync(UpdateWorkingShiftRequest request);
    
    Task CreateRangeAsync(List<CreateWorkingShiftRequest> values, Guid calendarId);
}