using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.Identity;

public class IsPasswordCorrectValidatorFor : AsyncPropertyValidator<ChangePasswordRequest, string>
{
    private readonly ApplicationContext _applicationContext;

    public IsPasswordCorrectValidatorFor(ApplicationContext applicationContext)
    {
        _applicationContext = applicationContext;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<ChangePasswordRequest> context, string value,
        CancellationToken cancellation)
    {
        var user = await _applicationContext.Users
            .FirstOrDefaultAsync(_ => _.Id == context.InstanceToValidate.Id, cancellationToken: cancellation);

        if (user is null)
        {
            return false;
        }
        
        var userHasValidPassword = SecurePasswordHasher.Verify(
            value,
            user.PasswordHash!
        );

        return userHasValidPassword;
    }

    public override string Name => "IsPasswordCorrectValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Old password is not correct";
}