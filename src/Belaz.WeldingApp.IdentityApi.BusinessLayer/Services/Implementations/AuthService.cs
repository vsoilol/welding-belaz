using System.Security.Cryptography;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Responses;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Exceptions;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Models;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Implementations;

internal class AuthService : IAuthService
{
    private readonly IUserRepository _userRepository;
    private readonly ITokenService _tokenService;
    private readonly IValidationService _validationService;
    private readonly IEmailSender _emailSender;

    public AuthService(
        IUserRepository userRepository,
        ITokenService tokenService, IValidationService validationService, IEmailSender emailSender)
    {
        _userRepository = userRepository;
        _tokenService = tokenService;
        _validationService = validationService;
        _emailSender = emailSender;
    }

    public async Task<Result<UserDto>> ChangeUserCredentialsAsync(
        ChangeUserCredentialsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<UserDto>(validationResult.Exception);
        }

        var existedUser = await _userRepository.GetIdentityUserByUsernameAsync(request.UserName);

        if (existedUser is not null && existedUser.Id != request.UserId)
        {
            return new Result<UserDto>(new RegisterFailedException(
                $"User with username: {request.UserName} already exist!"
            ));
        }

        var user = await _userRepository.UpdateUserCredentialsAsync(request.UserId, request.UserName,
            SecurePasswordHasher.Hash(request.Password));

        return user;
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

    public async Task<Result<ConfirmEmailResponse>> GenerateEmailConfirmationTokenAsync(
        GenerateEmailConfirmationTokenRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<ConfirmEmailResponse>(validationResult.Exception);
        }

        var user = await _userRepository.GetUserByIdAsync(request.Id);

        var token = CreateRandomToken();

        await _userRepository.UpdateConfirmEmailTokenAsync(user.Id, token);

        return new ConfirmEmailResponse
        {
            Token = token,
            Id = user.Id,
            Email = user.Email!
        };
    }

    public Task<bool> ConfirmEmailAsync(Guid id, string token)
    {
        return _userRepository.CheckConfirmEmailTokenValidAsync(id, token);
    }

    public async Task SendNewCredentialsEmailAsync(Guid id, string username, string password)
    {
        var user = await _userRepository.GetUserByIdAsync(id);
        
        var emailBody =
            $"The administrator changed your credentials:" +
            $"<br>New Login: {username}" +
            $"<br>New Password: {password}";

        var message = new Message(
            new[] { user.Email! },
            "New credentials",
            emailBody);

        await _emailSender.SendEmailAsync(message);
    }

    public Task<bool> LogoutAsync()
    {
        return Task.FromResult(true);
    }

    private string CreateRandomToken()
    {
        return Convert.ToHexString(RandomNumberGenerator.GetBytes(64));
    }
}