using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IMasterRepository
{
    Task<List<MasterDto>> GetAllAsync();
    
    Task<MasterDto> GetByIdAsync(Guid id);
        
    Task<MasterDto> CreateAsync(Master entity, IReadOnlyList<Guid>? weldingEquipmentIds);
    
    Task<MasterDto> UpdateAsync(Master entity, IReadOnlyList<Guid>? weldingEquipmentIds);
}