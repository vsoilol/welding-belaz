using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class SetUniqueNumberForProductRequestValidator : AbstractValidator<SetUniqueNumberForProductRequest>
{
    public SetUniqueNumberForProductRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    SetUniqueNumberForProductRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );

        RuleFor(model => model.UniqueNumber)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new UniqueNumberValidator(context));
    }
}