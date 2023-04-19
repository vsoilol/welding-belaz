using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class AssignProductToMasterRequestValidator : AbstractValidator<AssignProductToMasterRequest>
{
    public AssignProductToMasterRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.MasterId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductToMasterRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Master
                >(context)
            );

        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductToMasterRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Product
                >(context)
            );
    }
}
