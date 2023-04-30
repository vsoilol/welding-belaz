using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.Identity;

public class EmailAlreadyConfirmValidatorFor<T> : AsyncPropertyValidator<T, Guid>
{
    private readonly ApplicationContext _context;

    public EmailAlreadyConfirmValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, Guid value,
        CancellationToken cancellation)
    {
        var user = await _context.Users.FirstOrDefaultAsync(_ => _.Id == value,
            cancellationToken: cancellation);

        if (user is null)
        {
            return false;
        }

        return user.Email is not null && !user.IsEmailConfirmed;
    }

    public override string Name => "EmailAlreadyConfirmValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This email already confirm or email is empty";
}