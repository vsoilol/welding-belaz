using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class ChangeEndWeldingDateRequestValidator : AbstractValidator<ChangeEndWeldingDateRequest>
{
    public ChangeEndWeldingDateRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeEndWeldingDateRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );

        When(model => model.WeldingEndDate is not null,
            () =>
            {
                RuleFor(model => model.WeldingEndDate!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new DateValidatorFor<ChangeEndWeldingDateRequest>())
                    .SetAsyncValidator(new WeldingDateValidator(context));
            }
        );
    }
}