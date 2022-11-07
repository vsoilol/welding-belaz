using AutoMapper;
using Belaz.WeldingApp.IdentityApi.WebApi.Exceptions;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Presenters.Models;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Presenters
{
    public class UserPresenter : IUserPresenter
    {
        private readonly IUserManager _userManager;
        private readonly IAuthManager _authManager;
        private readonly IMapper _mapper;

        public UserPresenter(IUserManager userManager, IAuthManager authManager, IMapper mapper)
        {
            _userManager = userManager;
            _authManager = authManager;
            _mapper = mapper;
        }

        public async Task<IEnumerable<UserContract>> GetAllAsync()
        {
            var users = await _userManager.GetAllAsync();

            var userContractCollection = _mapper.Map<IEnumerable<UserContract>>(users);

            return userContractCollection;
        }

        public async Task<UserContract> GetByIdAsync(int id)
        {
            var user = await _userManager.GetByIdAsync(id);

            var userContract = _mapper.Map<UserContract>(user);

            return userContract;
        }

        public async Task<UserContract> AddAsync(UserContract user)
        {
            var registerModel = new RegisterModel
            {
                FirstName = user.FirstName,
                LastName = user.LastName,
                MiddleName = user.MiddleName,
                Email = user.Email,
                UserName = user.Email,
                Role = user.Role
            };

            var authResult = await _authManager.Register(registerModel);

            if (!authResult.Success)
            {
                throw new RegisterFailedException(registerModel.UserName);
            }

            var createdUser = await _userManager.AsQueryable().FirstOrDefaultAsync(x => x.UserName == user.Email);

            var userContract = _mapper.Map<UserContract>(createdUser);

            return userContract;
        }

        public async Task<UserContract> UpdateAsync(int id, UserContract user)
        {
            var userToUpdate = _mapper.Map<User>(user);

            var updatedUser = await _userManager.UpdateAsync(id, userToUpdate);

            var userContract = _mapper.Map<UserContract>(updatedUser);

            return userContract;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var result = await _userManager.DeleteAsync(id);

            return result;
        }
    }
}
