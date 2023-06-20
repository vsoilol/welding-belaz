using Belaz.WeldingApp.RegistarApi.Domain.Dtos;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IWelderRepository
{
    Task<WelderDto> GetByRfidTagAsync(string rfidTag);
    
    Task<WelderDto> GetByIdAsync(Guid id);
}