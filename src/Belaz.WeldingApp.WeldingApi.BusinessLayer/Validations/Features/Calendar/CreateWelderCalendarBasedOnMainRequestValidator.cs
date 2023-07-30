using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateWelderCalendarBasedOnMainRequestValidator : AbstractValidator<CreateWelderCalendarBasedOnMainRequest>
{
    public CreateWelderCalendarBasedOnMainRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<CreateWelderCalendarBasedOnMainRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Welder>(context));
        
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new MainCalendarIsNotExistValidatorFor<CreateWelderCalendarBasedOnMainRequest>(context));
    }
}