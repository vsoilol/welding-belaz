using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateCalendarWithWelderIdRequestValidator : AbstractValidator<CreateCalendarWithWelderIdRequest>
{
    public CreateCalendarWithWelderIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreateCalendarWithWelderIdRequest, Welder>(context));

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new WelderYearValidatorFor(context));

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