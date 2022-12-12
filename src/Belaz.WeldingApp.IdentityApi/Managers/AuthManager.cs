using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Extensions;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.Options;
using Belaz.WeldingApp.IdentityApi.Presenters.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace Belaz.WeldingApp.IdentityApi.Managers
{
    public class AuthManager : IAuthManager
    {
        private readonly AuthOptions _authOptions;
        private readonly IRepository<UserData> _userRepository;
        private readonly IRoleRepository _roleRepository;
        private readonly ITokenManager _tokenManager;

        private HttpContext HttpContext { get; set; }

        public AuthManager(IHttpContextAccessor httpContextAccessor, IOptions<AuthOptions> options,
            IRepository<UserData> userRepository, IRoleRepository roleRepository, ITokenManager tokenManager)
        {
            _authOptions = options.Value;
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            _tokenManager = tokenManager;
            HttpContext = httpContextAccessor.HttpContext;
        }

        public async Task<AuthenticationResult> Login(LoginModel login)
        {
            var userData = (await _userRepository.GetByFilterAsync(x => x.UserName == login.UserName)).FirstOrDefault();

            if (userData is null)
            {
                return new AuthenticationResult { Errors = new[] { "User does not exist" }, };
            }

            var userHasValidPassword = SecurePasswordHasher.Verify(login.Password, userData.PasswordHash);

            if (!userHasValidPassword)
            {
                return new AuthenticationResult { Errors = new[] { "User/password combination is wrong" }, };
            }

            return _tokenManager.GenerateAuthenticationResultForUser(userData);
        }

        public async Task<bool> Logout()
        {
            await HttpContext.SignOutAsync();
            HttpContext.Session.Clear();

            return true;
        }

        public async Task<AuthenticationResult> Register(RegisterModel registerContract)
        {
            var userContains = (await _userRepository.AsQueryable()
                .FirstOrDefaultAsync(x =>
                    x.UserName == registerContract.UserName || x.Email == registerContract.Email)) is not null;

            if (userContains)
            {
                return new AuthenticationResult
                {
                    Errors = new[] { $"User with email: {registerContract.Email} already exist!" },
                };
            }

            if (string.IsNullOrWhiteSpace(registerContract.Password))
            {
                registerContract.Password = _authOptions.DefaultPassword;
            }

            var userRole = await _roleRepository.GetRoleByName(registerContract.Role);

            if (userRole is null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] { $"Cannot find {registerContract.Role} role!" },
                };
            }

            var newUser = new UserData
            {
                FirstName = registerContract.FirstName,
                MiddleName = registerContract.MiddleName,
                LastName = registerContract.LastName,
                Email = registerContract.Email,
                UserName = registerContract.UserName,
                PasswordHash = SecurePasswordHasher.Hash(registerContract.Password),
                UserRoles = new List<UserRole>
                {
                    new UserRole
                    {
                        Role = userRole
                    }
                }
            };

            var createdUser = await _userRepository.AddAsync(newUser);
            await _userRepository.SaveAsync();

            return _tokenManager.GenerateAuthenticationResultForUser(createdUser);
        }
    }
}
