using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class AssignProductToWeldersRequestValidator
    : AbstractValidator<AssignProductToWeldersRequest>
{
    public AssignProductToWeldersRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductToWeldersRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Product
                >(context)
            );

        RuleForEach(model => model.WelderIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductToWeldersRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Welder
                >(context)
            );
    }
}
