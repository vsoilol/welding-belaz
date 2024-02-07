using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccountTask;

public class ChangeDefectiveAmountRequestValidator : AbstractValidator<ChangeDefectiveAmountRequest>
{
    public ChangeDefectiveAmountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountTaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeDefectiveAmountRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask
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