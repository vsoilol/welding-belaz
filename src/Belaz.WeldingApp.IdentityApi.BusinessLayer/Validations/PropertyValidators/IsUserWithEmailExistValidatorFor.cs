using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;

public class IsUserWithEmailExistValidatorFor<T> : AsyncPropertyValidator<T, string>
{
    private readonly ApplicationContext _context;

    public IsUserWithEmailExistValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, string value, CancellationToken cancellation)
    {
        var isExist = await _context.Users.AnyAsync(_ => _.Email == value, cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsUserWithEmailExistValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "User with this email already exist";
}
