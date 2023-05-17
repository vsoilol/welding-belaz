using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class AddProductAccountRequestValidator : AbstractValidator<AddProductAccountRequest>
{
    public AddProductAccountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(
                new IsProductEqualsForTypeValidatorFor<AddProductAccountRequest>(context, ProductType.Product)
            )
            .SetAsyncValidator(new IsProductAccountIsExistWithoutUniqueNumberPropertyValidator(context));

        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<AddProductAccountRequest>());
        
        RuleFor(model => model.UniqueNumber)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new UniqueNumberValidatorForAddProductAccount(context))
            .When(_ => _.UniqueNumber is not null);
    }
}