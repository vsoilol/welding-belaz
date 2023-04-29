using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IEventLogRepository
{
    Task<List<EventLogDto>> GetAllAsync();
    
    Task<EventLogDto> GetByIdAsync(Guid id);

    Task<EventLogDto> AddAsync(EventLog entity);
}