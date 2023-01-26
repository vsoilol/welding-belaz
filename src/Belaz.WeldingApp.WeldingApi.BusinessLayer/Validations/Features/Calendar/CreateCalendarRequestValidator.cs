using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateCalendarRequestValidator : AbstractValidator<CreateCalendarRequest>
{
    public CreateCalendarRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new ExistYearValidatorFor<CreateCalendarRequest>(context));

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