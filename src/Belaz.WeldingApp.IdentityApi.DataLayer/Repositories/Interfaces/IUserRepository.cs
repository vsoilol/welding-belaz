using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;

namespace Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Interfaces;

public interface IUserRepository
{
    Task<UserDto> GetUserByIdAsync(Guid id);

    Task<IdentityUserDto?> GetIdentityUserByUsernameAsync(string username);

    Task<UserDto> UpdateUserCredentialsAsync(Guid id, string username, string passwordHash);

    Task<List<UserDto>> GetAllUsersAsync();
    
    Task<UserDto> CreateUserAsync(UserData entity);
    
    Task<UserDto> UpdateUserAsync(UserData entity);
    
    Task DeleteUserAsync(Guid id);
    
    Task UpdateConfirmEmailTokenAsync(Guid id, string token);
    
    Task<bool> CheckConfirmEmailTokenValidAsync(Guid id, string token);
}