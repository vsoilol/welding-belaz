using Belaz.WeldingApp.IdentityApi.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.Contracts.Responses.Identity;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Entities;
using Belaz.WeldingApp.IdentityApi.Data.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Exceptions;
using Belaz.WeldingApp.IdentityApi.Extensions;
using Belaz.WeldingApp.IdentityApi.Managers.Interfaces;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using WeldingApp.Common.Options;

namespace Belaz.WeldingApp.IdentityApi.Managers.Implementations;

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

    public async Task<AuthSuccessResponse> Login(LoginModelContract login)
    {
        var userData = (await _userRepository.GetByFilterAsync(x => x.UserName == login.UserName)).FirstOrDefault();

        if (userData is null)
        {
            throw new LoginFailedException("User does not exist");
        }

        var userHasValidPassword = SecurePasswordHasher.Verify(login.Password, userData.PasswordHash);

        if (!userHasValidPassword)
        {
            throw new LoginFailedException("User/password combination is wrong");
        }

        return _tokenManager.GenerateAuthenticationResultForUser(userData);
    }

    public async Task<bool> Logout()
    {
        await HttpContext.SignOutAsync();
        HttpContext.Session.Clear();

        return true;
    }

    public async Task<AuthSuccessResponse> Register(RegisterModelContract registerContract)
    {
        var userContains = (await _userRepository.AsQueryable()
            .FirstOrDefaultAsync(x =>
                x.UserName == registerContract.UserName || x.Email == registerContract.Email)) is not null;

        if (userContains)
        {
            throw new RegisterFailedException($"User with email: {registerContract.Email} already exist!");
        }

        if (string.IsNullOrWhiteSpace(registerContract.Password))
        {
            registerContract.Password = _authOptions.DefaultPassword;
        }

        var userRole = await _roleRepository.GetRoleByName(registerContract.Role);

        if (userRole is null)
        {
            throw new RegisterFailedException($"Cannot find {registerContract.Role} role!");
        }

        var newUser = new UserData
        {
            FirstName = registerContract.FirstName,
            MiddleName = registerContract.MiddleName,
            LastName = registerContract.LastName,
            Email = registerContract.Email,
            UserName = registerContract.UserName,
            PasswordHash = SecurePasswordHasher.Hash(registerContract.Password),
            UserRoles = new List<UserRole> { new UserRole { Role = userRole } }
        };

        var createdUser = await _userRepository.AddAsync(newUser);
        await _userRepository.SaveAsync();

        return _tokenManager.GenerateAuthenticationResultForUser(createdUser);
    }
}
