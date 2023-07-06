using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateMainCalendarByYearRequestValidator : AbstractValidator<CreateMainCalendarByYearRequest>
{
    public CreateMainCalendarByYearRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.NewYear)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new MainCalendarIsAlreadyExistValidatorFor(context));

        RuleFor(model => model.OldYear)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new MainCalendarIsNotExistValidatorFor<CreateMainCalendarByYearRequest>(context));
    }
}