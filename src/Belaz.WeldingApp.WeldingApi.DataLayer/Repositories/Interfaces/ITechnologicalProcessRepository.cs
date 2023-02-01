using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface ITechnologicalProcessRepository
{
    Task<TechnologicalProcessDto> GetByIdAsync(Guid id);
    
    Task<List<TechnologicalProcessDto>> GetAllAsync();
    
    Task<TechnologicalProcessDto> CreateAsync(TechnologicalProcess entity);
    
    Task<TechnologicalProcessDto> UpdateAsync(TechnologicalProcess entity);
}