using Belaz.WeldingApp.Common.Entities.IdentityUser;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Contracts.Requests.Identity;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators.Identity;
using Belaz.WeldingApp.IdentityApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Features.Identity;

public class GenerateEmailConfirmationTokenRequestValidator
    : AbstractValidator<GenerateEmailConfirmationTokenRequest>
{
    public GenerateEmailConfirmationTokenRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new SqlIdValidatorFor<GenerateEmailConfirmationTokenRequest, UserData>(context))
            .SetAsyncValidator(new EmailAlreadyConfirmValidatorFor<GenerateEmailConfirmationTokenRequest>(context));
    }
}