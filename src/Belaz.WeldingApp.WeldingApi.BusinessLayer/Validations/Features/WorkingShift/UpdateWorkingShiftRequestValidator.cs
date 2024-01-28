using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WorkingShift;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class UpdateWorkingShiftRequestValidator : AbstractValidator<UpdateWorkingShiftRequest>
{
    public UpdateWorkingShiftRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateWorkingShiftRequest,
                    Belaz.WeldingApp.Common.Entities.CalendarInfo.WorkingShift
                >(context)
            );

        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(10)
            .SetAsyncValidator(new WorkingShiftUniquenessUpdateValidator(context));

        When(
            _ => _.BreakStart is not null,
            () =>
            {
                RuleFor(model => model.BreakEnd!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<UpdateWorkingShiftRequest>());
            }
        );

        When(
            _ => _.BreakEnd is not null,
            () =>
            {
                RuleFor(model => model.BreakStart!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<UpdateWorkingShiftRequest>());
            }
        );

        RuleFor(model => model.ShiftStart)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<UpdateWorkingShiftRequest>());

        RuleFor(model => model.ShiftEnd)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<UpdateWorkingShiftRequest>());
    }
}
