using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WorkingShift;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class CreateWorkingShiftWithYearRequestValidator
    : AbstractValidator<CreateWorkingShiftWithYearRequest>
{
    public CreateWorkingShiftWithYearRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(10)
            .SetAsyncValidator(new WorkingShiftUniquenessValidator(context));

        When(
            _ => _.BreakStart is not null,
            () =>
            {
                RuleFor(model => model.BreakEnd!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());
            }
        );

        When(
            _ => _.BreakEnd is not null,
            () =>
            {
                RuleFor(model => model.BreakStart!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());
            }
        );

        RuleFor(model => model.ShiftStart)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());

        RuleFor(model => model.ShiftEnd)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());

        When(
            _ => _.CalendarId is null,
            () =>
            {
                RuleFor(model => model.DayId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .SetValidator(
                        new SqlIdValidatorFor<
                            CreateWorkingShiftWithYearRequest,
                            Belaz.WeldingApp.Common.Entities.CalendarInfo.Day
                        >(context)
                    );
            }
        );

        When(
            _ => _.CalendarId is not null,
            () =>
            {
                RuleFor(model => model.DayId).Cascade(CascadeMode.Stop).Null();

                RuleFor(model => model.CalendarId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .NotEmpty()
                    .SetValidator(
                        new SqlIdValidatorFor<
                            CreateWorkingShiftWithYearRequest,
                            Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar
                        >(context)
                    );
            }
        );

        When(
            _ => _.DayId is not null,
            () =>
            {
                RuleFor(model => model.CalendarId).Cascade(CascadeMode.Stop).Null();

                RuleFor(model => model.DayId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .SetValidator(
                        new SqlIdValidatorFor<
                            CreateWorkingShiftWithYearRequest,
                            Belaz.WeldingApp.Common.Entities.CalendarInfo.Day
                        >(context)
                    );
            }
        );

        When(
            _ => _.DayId is null,
            () =>
            {
                RuleFor(model => model.CalendarId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .NotEmpty()
                    .SetValidator(
                        new SqlIdValidatorFor<
                            CreateWorkingShiftWithYearRequest,
                            Belaz.WeldingApp.Common.Entities.CalendarInfo.Calendar
                        >(context)
                    );
            }
        );
    }
}
