using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class AssignProductsToInspectorRequestValidator
    : AbstractValidator<AssignProductsToInspectorRequest>
{
    public AssignProductsToInspectorRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.ProductIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductsToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Product
                >(context)
            )
            .SetAsyncValidator(new IsInspectorAlreadyHasProductValidatorAssignProducts(context));

        RuleFor(model => model.InspectorId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductsToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Inspector
                >(context)
            );
    }
}
