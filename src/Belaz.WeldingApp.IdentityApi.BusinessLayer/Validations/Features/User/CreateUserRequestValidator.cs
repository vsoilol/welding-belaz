using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.User;

public class CreateUserRequestValidator : AbstractValidator<CreateUserRequest>
{
    public CreateUserRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.FirstName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.LastName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.MiddleName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.Email)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new EmailValidatorFor<CreateUserRequest>())
            .SetAsyncValidator(new IsUserWithEmailExistValidatorFor<CreateUserRequest>(context));

        RuleFor(model => model.Role)
            .Cascade(CascadeMode.Stop)
            .IsInEnum();
    }
}
