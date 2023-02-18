using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWelderRepository
{
    Task<List<WelderDto>> GetAllAsync();

    Task<WelderDto> GetByIdAsync(Guid id);

    Task<WelderDto> CreateAsync(Welder entity);
    
    Task<WelderDto> UpdateAsync(Welder entity);
}