using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class ChangeProductAccountAcceptedAmountRequestValidator
    : AbstractValidator<ChangeProductAccountAcceptedAmountRequest>
{
    public ChangeProductAccountAcceptedAmountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeProductAccountAcceptedAmountRequest,
                    Domain.Entities.ProductInfo.ProductAccount
                >(context)
            );

        RuleFor(model => model.Amount)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new IsAcceptedAmountCorrectValidatorForChangeAmount(context));
    }
}
