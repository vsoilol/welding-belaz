using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class UpdateCalendarRequestValidator : AbstractValidator<UpdateCalendarRequest>
{
    public UpdateCalendarRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new YearValidatorFor<UpdateCalendarRequest>());

        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateCalendarRequest, Domain.Entities.CalendarInfo.Calendar>(context));
    }
}