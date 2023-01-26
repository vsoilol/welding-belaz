using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class CreateWorkingShiftRequestValidator : AbstractValidator<CreateWorkingShiftRequest>
{
    public CreateWorkingShiftRequestValidator()
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(10);
        
        When(_ => _.BreakStart is not null,
            () =>
            {
                RuleFor(model => model.BreakEnd!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<CreateWorkingShiftRequest>());
            });
        
        When(_ => _.BreakEnd is not null,
            () =>
            {
                RuleFor(model => model.BreakStart!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<CreateWorkingShiftRequest>());
            });
        
        RuleFor(model => model.ShiftStart)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWorkingShiftRequest>());
        
        RuleFor(model => model.ShiftEnd)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWorkingShiftRequest>());
    }
}