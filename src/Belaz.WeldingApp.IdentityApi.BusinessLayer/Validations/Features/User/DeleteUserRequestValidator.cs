using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.User;

public class DeleteUserRequestValidator : AbstractValidator<DeleteUserRequest>
{
    public DeleteUserRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new SqlIdValidatorFor<DeleteUserRequest, UserData>(context));
    }
}