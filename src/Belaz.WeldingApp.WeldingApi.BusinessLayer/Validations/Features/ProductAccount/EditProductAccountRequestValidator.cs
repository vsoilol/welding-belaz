using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class EditProductAccountRequestValidator : AbstractValidator<EditProductAccountRequest>
{
    public EditProductAccountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    EditProductAccountRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );
        
        RuleFor(model => model.AmountFromPlan)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0);
        
        RuleFor(model => model.SequenceNumbers)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .NotEmpty();
    }
}