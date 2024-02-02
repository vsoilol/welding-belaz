using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class ChangeDefectiveAmountRequestValidator : AbstractValidator<ChangeDefectiveAmountRequest>
{
    public ChangeDefectiveAmountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeDefectiveAmountRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );

        RuleFor(model => model.InspectorId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeDefectiveAmountRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Inspector
                >(context)
            );
        
        RuleFor(model => model.DefectiveAmount)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0)
            .SetAsyncValidator(new DefectiveAmountValidator(context));
    }
}