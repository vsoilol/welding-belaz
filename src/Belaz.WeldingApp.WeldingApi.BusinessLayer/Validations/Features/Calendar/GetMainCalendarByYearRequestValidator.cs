using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class GetMainCalendarByYearRequestValidator : AbstractValidator<GetMainCalendarByYearRequest>
{
    public GetMainCalendarByYearRequestValidator()
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new YearValidatorFor<GetMainCalendarByYearRequest>());
    }
}