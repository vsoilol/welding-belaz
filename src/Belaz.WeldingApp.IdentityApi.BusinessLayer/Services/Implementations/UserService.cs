using AutoMapper;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Services.Implementations;

internal class UserService : IUserService
{
    private readonly IUserRepository _userRepository;
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;

    public UserService(IUserRepository userRepository, IValidationService validationService, IMapper mapper)
    {
        _userRepository = userRepository;
        _validationService = validationService;
        _mapper = mapper;
    }

    public Task<List<UserDto>> GetAllAsync()
    {
        return _userRepository.GetAllUsersAsync();
    }

    public async Task<Result<UserDto>> GetByIdAsync(GetUserByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<UserDto>(validationResult.Exception);
        }

        return await _userRepository.GetUserByIdAsync(request.Id);
    }

    public async Task<Result<UserDto>> AddAsync(CreateUserRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<UserDto>(validationResult.Exception);
        }

        var createdUser = _mapper.Map<UserData>(request);

        return await _userRepository.CreateUserAsync(createdUser);
    }

    public async Task<Result<UserDto>> UpdateAsync(UpdateUserRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<UserDto>(validationResult.Exception);
        }

        var updatedUser = _mapper.Map<UserData>(request);
        var user = await _userRepository.GetUserByIdAsync(request.Id);

        if (user.Email != updatedUser.Email)
        {
            updatedUser.IsEmailConfirmed = false;
        }

        return await _userRepository.UpdateUserAsync(updatedUser);
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteUserRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _userRepository.DeleteUserAsync(request.Id);

        return Unit.Default;
    }
}