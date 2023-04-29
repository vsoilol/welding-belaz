using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.User;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.User;

public class GetUserByIdRequestValidator : AbstractValidator<GetUserByIdRequest>
{
    public GetUserByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new SqlIdValidatorFor<GetUserByIdRequest, UserData>(context));
    }
}