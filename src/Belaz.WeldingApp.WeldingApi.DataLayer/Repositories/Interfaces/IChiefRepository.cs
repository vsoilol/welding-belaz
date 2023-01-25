using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IChiefRepository
{
    Task<List<ChiefDto>> GetAllAsync();

    Task<bool> UpdateAsync(Chief entity);

    Task<ChiefDto> CreateAsync(Chief entity);
}