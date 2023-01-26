using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class CreateWorkingShiftWithYearRequestValidator : AbstractValidator<CreateWorkingShiftWithYearRequest>
{
    public CreateWorkingShiftWithYearRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(10);

        When(_ => _.BreakStart is not null,
            () =>
            {
                RuleFor(model => model.BreakEnd!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());
            });

        When(_ => _.BreakEnd is not null,
            () =>
            {
                RuleFor(model => model.BreakStart!)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());
            });

        RuleFor(model => model.ShiftStart)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());

        RuleFor(model => model.ShiftEnd)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWorkingShiftWithYearRequest>());

        When(_ => _.Year is null,
            () =>
            {
                RuleFor(model => model.DayId)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .SetValidator(new SqlIdValidatorFor<CreateWorkingShiftWithYearRequest,
                        Domain.Entities.CalendarInfo.Day>(context));
            });

        When(_ => _.Year is not null,
            () =>
            {
                RuleFor(model => model.DayId)
                    .Cascade(CascadeMode.Stop)
                    .Null();
            });

        When(_ => _.DayId is not null,
            () =>
            {
                RuleFor(model => model.Year)
                    .Cascade(CascadeMode.Stop)
                    .Null();
            });

        When(_ => _.DayId is null,
            () =>
            {
                RuleFor(model => model.Year)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .NotEmpty()
                    .SetValidator(new YearValidatorFor<CreateWorkingShiftWithYearRequest>());
            });
    }
}