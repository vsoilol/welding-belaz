using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateCalendarRequestValidator : AbstractValidator<CreateCalendarRequest>
{
    public CreateCalendarRequestValidator()
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new YearValidatorFor<CreateCalendarRequest>());

        RuleFor(model => model.MainWorkingShift)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .NotEmpty();

        RuleForEach(model => model.MainWorkingShift)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new CreateWorkingShiftRequestValidator());
        
        When(_ => _.Days is not null,
            () =>
            {
                RuleForEach(model => model.Days)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new CreateDayRequestValidator());
            });
    }
}