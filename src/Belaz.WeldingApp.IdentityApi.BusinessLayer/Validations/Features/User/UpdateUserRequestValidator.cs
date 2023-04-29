using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.User;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.User;

public class UpdateUserRequestValidator : AbstractValidator<UpdateUserRequest>
{
    public UpdateUserRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new SqlIdValidatorFor<UpdateUserRequest, UserData>(context));
        
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
            .SetValidator(new EmailValidatorFor<UpdateUserRequest>())
            .SetAsyncValidator(new IsEmailExistValidatorForUpdate(context));

        RuleFor(model => model.Role)
            .Cascade(CascadeMode.Stop)
            .IsInEnum();
    }
}