using Belaz.WeldingApp.Common.Options;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Interfaces;
using LanguageExt.Common;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Implementations;

internal class AuthService : IAuthService
{
    private readonly IUserRepository _userRepository;
    private readonly ITokenService _tokenService;
    private readonly IValidationService _validationService;

    public AuthService(
        IUserRepository userRepository,
        ITokenService tokenService, IValidationService validationService)
    {
        _userRepository = userRepository;
        _tokenService = tokenService;
        _validationService = validationService;
    }

    public async Task<Result<AuthSuccessResponse>> ChangeUserCredentialsAsync(
        ChangeUserCredentialsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<AuthSuccessResponse>(validationResult.Exception);
        }

        var isUsernameAlreadyExist = await _userRepository.IsUserByUsernameExistAsync(request.UserName);

        if (isUsernameAlreadyExist)
        {
            return new Result<AuthSuccessResponse>(new RegisterFailedException(
                $"User with username: {request.UserName} already exist!"
            ));
        }

        var updatedUser = await _userRepository.UpdateUserCredentialsAsync(request.UserId, request.UserName,
            SecurePasswordHasher.Hash(request.Password));

        return _tokenService.GenerateAuthenticationResultForUser(updatedUser);
    }

    public async Task<Result<AuthSuccessResponse>> LoginAsync(LoginRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<AuthSuccessResponse>(validationResult.Exception);
        }

        var userData = await _userRepository.GetIdentityUserByUsernameAsync(request.UserName);

        if (userData is null)
        {
            return new Result<AuthSuccessResponse>(new LoginFailedException("User does not exist"));
        }

        var userHasValidPassword = SecurePasswordHasher.Verify(
            request.Password,
            userData.PasswordHash!
        );

        if (!userHasValidPassword)
        {
            return new Result<AuthSuccessResponse>(new LoginFailedException("User/password combination is wrong"));
        }

        return _tokenService.GenerateAuthenticationResultForUser(userData);
    }

    public Task<bool> LogoutAsync()
    {
        return Task.FromResult(true);
    }
}