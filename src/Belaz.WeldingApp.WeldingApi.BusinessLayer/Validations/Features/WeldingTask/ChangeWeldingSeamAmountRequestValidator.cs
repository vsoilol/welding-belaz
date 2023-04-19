using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingTask;

public class ChangeWeldingSeamAmountRequestValidator
    : AbstractValidator<ChangeWeldingSeamAmountRequest>
{
    public ChangeWeldingSeamAmountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeWeldingSeamAmountRequest,
                    Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingTask
                >(context)
            );

        RuleFor(model => model.SeamAmount).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(0);
    }
}
