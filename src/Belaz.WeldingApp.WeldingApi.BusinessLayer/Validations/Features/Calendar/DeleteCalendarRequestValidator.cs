using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class DeleteCalendarRequestValidator : AbstractValidator<DeleteCalendarRequest>
{
    public DeleteCalendarRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.CalendarId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<DeleteCalendarRequest,
                    Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar>(context));
    }
}