using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;

public interface IUserService
{
    Task<List<UserDto>> GetAllAsync();

    Task<Result<UserDto>> GetByIdAsync(GetUserByIdRequest request);

    Task<Result<UserDto>> AddAsync(CreateUserRequest request);

    Task<Result<UserDto>> UpdateAsync(UpdateUserRequest request);

    Task<Result<Unit>> DeleteAsync(DeleteUserRequest request);
}
