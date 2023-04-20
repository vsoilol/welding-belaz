using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class SetProductAccountDefectiveReasonRequestValidator
    : AbstractValidator<SetProductAccountDefectiveReasonRequest>
{
    public SetProductAccountDefectiveReasonRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    SetProductAccountDefectiveReasonRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );

        RuleFor(model => model.DefectiveReason).Cascade(CascadeMode.Stop).NotEmpty();
    }
}
