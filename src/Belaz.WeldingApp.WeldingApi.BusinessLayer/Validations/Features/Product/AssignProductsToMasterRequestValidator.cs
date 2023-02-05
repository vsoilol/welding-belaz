using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class AssignProductsToMasterRequestValidator : AbstractValidator<AssignProductsToMasterRequest>
{
    public AssignProductsToMasterRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.ProductIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignProductsToMasterRequest,
                Domain.Entities.ProductInfo.Product>(context))
            .SetAsyncValidator(new IsMasterAlreadyHasProductValidatorAssignProducts(context));

        RuleFor(model => model.MasterId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignProductsToMasterRequest,
                Domain.Entities.Users.Master>(context));
    }
}