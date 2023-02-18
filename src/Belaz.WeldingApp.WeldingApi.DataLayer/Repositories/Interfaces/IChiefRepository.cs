using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IChiefRepository
{
    Task<List<ChiefDto>> GetAllAsync();
    
    Task<ChiefDto> GetByIdAsync(Guid id);
        
    Task<ChiefDto> CreateAsync(Chief entity, IReadOnlyList<Guid>? weldingEquipmentIds);
    
    Task<ChiefDto> UpdateAsync(Chief entity, IReadOnlyList<Guid>? weldingEquipmentIds);
}