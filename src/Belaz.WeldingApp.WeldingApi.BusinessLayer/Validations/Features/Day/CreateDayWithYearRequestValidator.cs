using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Day;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;

public class CreateDayWithYearRequestValidator : AbstractValidator<CreateDayWithYearRequest>
{
    public CreateDayWithYearRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.MonthNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(12);
        
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(31);
        
        When(_ => !_.IsWorkingDay,
            () =>
            {
                RuleFor(model => model.WorkingShifts)
                    .Cascade(CascadeMode.Stop)
                    .Empty()
                    .WithMessage("Weekend does not contain WorkingShifts");
            });
        
        When(_ => _.IsWorkingDay,
            () =>
            {
                RuleFor(model => model.WorkingShifts)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .NotEmpty()
                    .WithMessage("Working day must contain WorkingShifts");
                
                RuleForEach(model => model.WorkingShifts)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new CreateWorkingShiftRequestValidator());
            });
        
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new YearValidatorFor<CreateDayWithYearRequest>());
        
        When(_ => _.WelderId is not null,
            () =>
            {
                RuleFor(model => model.WeldingEquipmentId)
                    .Cascade(CascadeMode.Stop)
                    .Null();
            });
        
        When(_ => _.WeldingEquipmentId is not null,
            () =>
            {
                RuleFor(model => model.WelderId)
                    .Cascade(CascadeMode.Stop)
                    .Null();
            });
        
        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new DayAlreadyExistValidatorForCreate(context));
    }
}