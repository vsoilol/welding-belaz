using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.Identity;

public class LoginRequestValidator : AbstractValidator<LoginRequest>
{
    public LoginRequestValidator()
    {
        When(_ => _.UserName != "admin",
            () =>
            {
                RuleFor(model => model.UserName)
                    .Cascade(CascadeMode.Stop)
                    .NotEmpty()
                    .SetValidator(new EmailValidatorFor<LoginRequest>())
                    .WithMessage("The UserName field is not a valid e-mail address.");
            });
        RuleFor(model => model.Password).Cascade(CascadeMode.Stop).NotEmpty();
    }
}
