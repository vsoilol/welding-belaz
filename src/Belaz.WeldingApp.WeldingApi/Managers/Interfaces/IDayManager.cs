using Belaz.WeldingApp.WeldingApi.Contracts.Requests.Day;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;

namespace Belaz.WeldingApp.WeldingApi.Managers.Interfaces;

public interface IDayManager
{
    Task<DayDto?> CreateAsync(CreateDayWithCalendarIdRequest request);
    
    Task UpdateAsync(UpdateDayRequest request);
    
    Task CreateRangeAsync(List<CreateDayRequest> values, Guid calendarId);
}