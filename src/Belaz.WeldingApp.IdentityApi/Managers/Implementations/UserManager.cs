using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.IdentityApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.User;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Exceptions;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.Managers.Implementations;

public class UserManager : IUserManager
{
    private readonly IRepository<UserData> _userRepository;
    private readonly IMapper _mapper;
    private readonly IRoleRepository _roleRepository;
    private readonly IAuthManager _authManager;

    public UserManager(IRepository<UserData> userRepository, IMapper mapper, IRoleRepository roleRepository,
        IAuthManager authManager)
    {
        _userRepository = userRepository;
        _mapper = mapper;
        _roleRepository = roleRepository;
        _authManager = authManager;
    }

    public async Task<IEnumerable<UserDto>> GetAllAsync()
    {
        var userDataCollection = await _userRepository.GetAllAsync();

        var users = _mapper.Map<IEnumerable<UserDto>>(userDataCollection);

        return users;
    }

    public async Task<UserDto> GetByIdAsync(Guid id)
    {
        var userData = await _userRepository.GetByIdAsync(id);

        var user = _mapper.Map<UserDto>(userData);

        return user;
    }

    public async Task<UserDto> AddAsync(CreateUserRequest user)
    {
        var registerModel = new RegisterModelContract
        {
            FirstName = user.FirstName,
            LastName = user.LastName,
            MiddleName = user.MiddleName,
            Email = user.Email,
            UserName = user.Email,
            Role = user.Role
        };

        await _authManager.Register(registerModel);

        var createdUser = await _userRepository
            .AsQueryable()
            .Where(_ => _.Email == user.Email)
            .ProjectTo<UserDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();

        return createdUser;
    }

    public async Task<bool> DeleteAsync(Guid id)
    {
        var isDeleted = await _userRepository.DeleteByIdAsync(id);

        isDeleted = await _userRepository.SaveAsync();

        return isDeleted;
    }

    public async Task<UserDto> UpdateAsync(Guid id, CreateUserRequest user)
    {
        var userData = await _userRepository.GetByIdAsync(id);

        if (userData == null)
        {
            throw new UserNotFoundException(id.ToString());
        }

        userData.FirstName = user.FirstName;
        userData.LastName = user.LastName;
        userData.MiddleName = user.MiddleName;

        if (user.Email != userData.Email)
        {
            userData.UserName = user.Email;
            userData.Email = user.Email;
        }

        var isUpdated = _userRepository.Update(userData);

        if (isUpdated)
        {
            await _userRepository.SaveAsync();

            var updatedUser = _mapper.Map<UserDto>(userData);

            return updatedUser;
        }

        throw new DbUpdateException($"Unable to update\\save new data for user with user name: {user.UserName}.");
    }
}
