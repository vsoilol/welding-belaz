using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Exceptions;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers
{
    public class UserManager : IUserManager
    {
        private readonly IRepository<UserData> _userRepository;
        private readonly IMapper _mapper;

        public UserManager(IRepository<UserData> userRepository, IMapper mapper)
        {
            _userRepository = userRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<User>> GetAllAsync()
        {
            var userDataCollection = await _userRepository.GetAllAsync();

            var users = _mapper.Map<IEnumerable<User>>(userDataCollection);

            return users;
        }

        public async Task<User> GetByIdAsync(int id)
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

        public Task<User> AddAsync(User user)
        {
            throw new NotImplementedException("");
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var isDeleted = await _userRepository.DeleteByIdAsync(id);

            isDeleted = await _userRepository.SaveAsync();

            return isDeleted;
        }


        public async Task<User> UpdateAsync(int id, User user)
        {
            var userData = await _userRepository.GetByIdAsync(id);

            if (userData == null)
            {
                throw new UserNotFoundException(id.ToString());
            }

            userData.UpdatedAt = DateTime.UtcNow;
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
