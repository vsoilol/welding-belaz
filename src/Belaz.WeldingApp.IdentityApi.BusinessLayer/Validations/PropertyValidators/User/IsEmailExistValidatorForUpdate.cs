using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.User;

public class IsEmailExistValidatorForUpdate : AsyncPropertyValidator<UpdateUserRequest, string>
{
    private readonly ApplicationContext _context;

    public IsEmailExistValidatorForUpdate(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<UpdateUserRequest> context, string value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Users.AnyAsync(_ => _.Email == value && _.Id != context.InstanceToValidate.Id,
            cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsEmailExistValidatorForUpdate";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "User with this email already exist";
}