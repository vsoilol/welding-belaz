using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.EventLog;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IEventLogService
{
    Task<BaseRequest<List<EventLogDto>>> GetAllAsync();
    
    Task<BaseResultRequest<EventLogDto>> AddAsync(AddEventLogRequest request, Guid userId);
}