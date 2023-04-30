using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.Identity;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.Identity;

public class ChangeUserCredentialsRequestValidator : AbstractValidator<ChangeUserCredentialsRequest>
{
    public ChangeUserCredentialsRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.UserName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .MinimumLength(5)
            .MaximumLength(100);

        RuleFor(model => model.Password)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .MinimumLength(6)
            .MaximumLength(100);

        RuleFor(model => model.UserId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new SqlIdValidatorFor<ChangeUserCredentialsRequest, UserData>(context))
            .SetAsyncValidator(new IsEmailNotConfirmOrEmptyValidatorFor<ChangeUserCredentialsRequest>(context));
    }
}