using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Exceptions;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.Managers
{
    public class UserManager : IUserManager
    {
        private readonly IRepository<UserData> _userRepository;
        private readonly IMapper _mapper;
        private readonly IRoleRepository _roleRepository;

        public UserManager(IRepository<UserData> userRepository, IMapper mapper, IRoleRepository roleRepository)
        {
            _userRepository = userRepository;
            _mapper = mapper;
            _roleRepository = roleRepository;
        }

        public async Task<IEnumerable<User>> GetAllAsync()
        {
            var userDataCollection = await _userRepository.GetAllAsync();

            var users = _mapper.Map<IEnumerable<User>>(userDataCollection);

            return users;
        }

        public async Task<User> GetByIdAsync(Guid id)
        {
            var userData = await _userRepository.GetByIdAsync(id);

            var user = _mapper.Map<User>(userData);

            return user;
        }

        public IQueryable<User> AsQueryable()
        {
            var userDataQuery = _userRepository.AsQueryable();

            var userQuery = userDataQuery.ProjectTo<User>(_mapper.ConfigurationProvider);

            return userQuery;
        }

        public async Task<User> AddAsync(User user)
        {
            if ((await _userRepository.GetByFilterAsync(x => x.UserName == user.UserName)).FirstOrDefault() is not null)
            {
                throw new UserExistsException(user.UserName);
            }

            var userData = _mapper.Map<UserData>(user);

            userData.PasswordHash = user.PasswordHash;

            var roles = await _roleRepository
                .GetAllRolesByNames(user.Roles.Select(_ => _.Name.ToLower()).ToList());

            userData.UserRoles = roles
                .Select(_ => new UserRole { Role = _ }).ToList();

            return _mapper.Map<User>(await _userRepository.AddAsync(userData));
        }

        public async Task<bool> DeleteAsync(Guid id)
        {
            var isDeleted = await _userRepository.DeleteByIdAsync(id);

            isDeleted = await _userRepository.SaveAsync();

            return isDeleted;
        }

        public async Task<User> UpdateAsync(Guid id, User user)
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

                var updatedUser = _mapper.Map<User>(userData);

                return updatedUser;
            }

            throw new DbUpdateException($"Unable to update\\save new data for user with user name: {user.UserName}.");
        }
    }
}
