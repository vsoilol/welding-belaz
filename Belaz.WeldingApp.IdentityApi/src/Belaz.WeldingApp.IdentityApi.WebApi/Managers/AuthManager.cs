using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Constants;
using Belaz.WeldingApp.IdentityApi.WebApi.Exceptions;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Interfaces;
using Belaz.WeldingApp.IdentityApi.WebApi.Managers.Models;
using Belaz.WeldingApp.IdentityApi.WebApi.Options;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Managers
{
    public class AuthManager : IAuthManager
    {
        private readonly AuthOptions _authOptions;
        private readonly IRepository<UserData> _userRepository;
        private readonly IRepository<RoleData> _roleRepository;
        private HttpContext HttpContext { get; set; }

        public AuthManager(IHttpContextAccessor httpContextAccessor, IOptions<AuthOptions> options, IRepository<UserData> userRepository, IRepository<RoleData> roleRepository)
        {
            _authOptions = options.Value;
            _userRepository = userRepository;
            _roleRepository = roleRepository;
            HttpContext = httpContextAccessor.HttpContext;
        }

        public async Task<LoginResponse> Login(LoginModel login)
        {
            var userData = (await _userRepository.GetByFilterAsync(x => x.UserName == login.UserName)).FirstOrDefault();

            if (userData == null)
            {
                throw new UserNotFoundException(login.UserName);
            }

            if (!VerifyPassword(login.Password, userData.PasswordHash, userData.PasswordSalt))
            {
                throw new LoginFailedException(login.UserName);
            }

            var loginResponse = GetLoginReponse(userData);

            return loginResponse;
        }

        public async Task<bool> Logout()
        {
            await HttpContext.SignOutAsync();
            HttpContext.Session.Clear();

            return true;
        }

        public async Task<LoginResponse> Register(RegisterModel registerContract)
        {
            var userContains = (await _userRepository.AsQueryable()
                .FirstOrDefaultAsync(x => x.UserName == registerContract.UserName || x.Email == registerContract.Email)) != null;

            if (userContains)
            {
                throw new DuplicateNameException($"User with email: {registerContract.Email} already exist!");
            }

            if (string.IsNullOrWhiteSpace(registerContract.Password))
            {
                registerContract.Password = _authOptions.DefaultPassword;
            }

            CreatePasswordHashAndSalt(registerContract.Password, out byte[] passwordHash, out byte[] passwordSalt);

            var userRoleId = RoleCollection.Roles[registerContract.Role];

            var role = await _roleRepository.GetByIdAsync(userRoleId);

            var newUser = new UserData
            {
                FirstName = registerContract.FirstName,
                MiddleName = registerContract.MiddleName,
                LastName = registerContract.LastName,
                Email = registerContract.Email,
                UserName = registerContract.UserName,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow,
                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt,
                UserRoles = new List<UserRoleData>
                {
                    new UserRoleData
                    {
                        RoleId = userRoleId,
                        Role = role
                    }
                }
            };

            await _userRepository.AddAsync(newUser);
            await _userRepository.SaveAsync();

            var loginResponse = GetLoginReponse(newUser);

            return loginResponse;
        }

        private LoginResponse GetLoginReponse(UserData user)
        {
            var token = CreateToken(user, out DateTime expiredAt);

            return new LoginResponse
            {
                Token = token,
                UserEmail = user.Email,
                Expiration = expiredAt
            };
        }

        private string CreateToken(UserData user, out DateTime expiredAt)
        {
            var role = user.UserRoles.FirstOrDefault()?.Role.Name;

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(ClaimTypes.Role, role ?? String.Empty)
            };

            var secret = _authOptions.Secret;
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            expiredAt = DateTime.UtcNow.AddHours(3);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: expiredAt,
                signingCredentials: cred);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private void CreatePasswordHashAndSalt(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            }
        }

        private bool VerifyPassword(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                var computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));

                return computedHash.SequenceEqual(passwordHash);
            }
        }
    }
}
