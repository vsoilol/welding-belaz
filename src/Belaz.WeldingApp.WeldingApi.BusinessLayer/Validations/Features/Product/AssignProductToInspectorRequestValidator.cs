using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class AssignProductToInspectorRequestValidator
    : AbstractValidator<AssignProductToInspectorRequest>
{
    public AssignProductToInspectorRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.InspectorId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Inspector
                >(context)
            );

        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Product
                >(context)
            );
    }
}
