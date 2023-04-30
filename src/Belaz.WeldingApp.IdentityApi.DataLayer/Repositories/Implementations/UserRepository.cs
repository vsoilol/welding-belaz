using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.IdentityApi.Domain.Dtos;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.DataLayer.Repositories.Implementations;

internal class UserRepository : IUserRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public UserRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<UserDto> GetUserByIdAsync(Guid id)
    {
        return _context.Users
            .Where(_ => _.Id == id)
            .ProjectTo<UserDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<IdentityUserDto?> GetIdentityUserByUsernameAsync(string username)
    {
        return _context.Users
            .Where(_ => _.UserName == username)
            .ProjectTo<IdentityUserDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<UserDto> UpdateUserCredentialsAsync(Guid id, string username, string passwordHash)
    {
        var updatedUser = (
            await _context.Users
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        updatedUser.UserName = username;
        updatedUser.PasswordHash = passwordHash;

        await _context.SaveChangesAsync();

        return (await _context.Users
            .Where(_ => _.Id == id)
            .ProjectTo<UserDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync())!;
    }

    public async Task UpdateUserPasswordAsync(Guid id, string passwordHash)
    {
        var updatedUser = (
            await _context.Users
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;
        
        updatedUser.PasswordHash = passwordHash;
        
        await _context.SaveChangesAsync();
    }

    public Task<List<UserDto>> GetAllUsersAsync()
    {
        return _context.Users
            .ProjectTo<UserDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<UserDto> CreateUserAsync(UserData entity)
    {
        var createdUser = _context.Users.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetUserByIdAsync(createdUser.Id);
    }

    public async Task<UserDto> UpdateUserAsync(UserData entity)
    {
        var updatedUser = (
            await _context.Users
                .FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedUser.FirstName = entity.FirstName;
        updatedUser.LastName = entity.LastName;
        updatedUser.MiddleName = entity.MiddleName;
        updatedUser.Email = entity.Email;
        updatedUser.IsEmailConfirmed = entity.IsEmailConfirmed;
        updatedUser.Role = entity.Role;

        await _context.SaveChangesAsync();

        return await GetUserByIdAsync(entity.Id);
    }

    public async Task DeleteUserAsync(Guid id)
    {
        var deletedUser = (
            await _context.Users.Include(_ => _.EventLogs).FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.Users.Remove(deletedUser);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateConfirmEmailTokenAsync(Guid id, string token)
    {
        var user = (await _context.Users.FirstOrDefaultAsync(_ => _.Id == id))!;

        user.ConfirmEmailToken = token;

        await _context.SaveChangesAsync();
    }

    public async Task<bool> CheckConfirmEmailTokenValidAsync(Guid id, string token)
    {
        var user = (await _context.Users.FirstOrDefaultAsync(_ => _.Id == id))!;

        if (user.ConfirmEmailToken != token)
        {
            return false;
        }

        user.IsEmailConfirmed = true;

        await _context.SaveChangesAsync();

        return true;
    }
}