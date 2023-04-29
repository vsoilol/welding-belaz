using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.EventLog;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IEventLogService
{
    Task<List<EventLogDto>> GetAllAsync();
    
    Task<Result<EventLogDto>> AddAsync(AddEventLogRequest request, Guid userId);
}