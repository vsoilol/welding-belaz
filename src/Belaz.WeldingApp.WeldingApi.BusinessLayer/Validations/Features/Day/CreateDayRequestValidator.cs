using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;

public class CreateDayRequestValidator : AbstractValidator<CreateDayRequest>
{
    public CreateDayRequestValidator()
    {
        RuleFor(model => model.MonthNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(12);
        
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(31);
        
        When(_ => !_.IsWorkingDay,
            () =>
            {
                RuleFor(model => model.WorkingShifts)
                    .Cascade(CascadeMode.Stop)
                    .Empty()
                    .WithMessage("Weekend does not contain WorkingShifts");
            });
        
        When(_ => _.IsWorkingDay,
            () =>
            {
                RuleFor(model => model.WorkingShifts)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .NotEmpty()
                    .WithMessage("Working day must contain WorkingShifts");
                
                RuleForEach(model => model.WorkingShifts)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new CreateWorkingShiftRequestValidator());
            });
    }
}