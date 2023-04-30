using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.Identity;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.Identity;

public class ChangePasswordRequestValidator : AbstractValidator<ChangePasswordRequest>
{
    public ChangePasswordRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new SqlIdValidatorFor<ChangePasswordRequest, UserData>(context))
            .SetAsyncValidator(new IsEmailNotConfirmOrEmptyValidatorFor<ChangePasswordRequest>(context));
        
        RuleFor(model => model.OldPassword)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .MinimumLength(6)
            .MaximumLength(100)
            .SetAsyncValidator(new IsPasswordCorrectValidatorFor(context));
        
        RuleFor(model => model.NewPassword)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .MinimumLength(6)
            .MaximumLength(100)
            .NotEqual(_ => _.OldPassword);
        
        RuleFor(model => model.ConfirmNewPassword)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .MinimumLength(6)
            .MaximumLength(100)
            .Equal(_ => _.NewPassword);
    }
}