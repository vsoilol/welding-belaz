using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IChiefRepository
{
    Task<List<ChiefDto>> GetAllAsync();

    Task<ChiefDto> GetByIdAsync(Guid id);

    Task<ChiefDto> CreateAsync(Chief entity);

    Task<ChiefDto> UpdateAsync(Chief entity);
}
