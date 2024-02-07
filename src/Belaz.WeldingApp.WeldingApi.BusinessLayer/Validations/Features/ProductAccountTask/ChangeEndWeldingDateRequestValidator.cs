

using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccountTask;

public class ChangeEndWeldingDateRequestValidator : AbstractValidator<ChangeEndWeldingDateRequest>
{
    public ChangeEndWeldingDateRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountTaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeEndWeldingDateRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask
                >(context)
            );

        When(model => model.WeldingEndDate is not null,
            () =>
            {
                RuleFor(model => model.WeldingEndDate!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new DateValidatorFor<ChangeEndWeldingDateRequest>())
                    .SetAsyncValidator(new WeldingDateValidator(context));
            }
        );
    }
}