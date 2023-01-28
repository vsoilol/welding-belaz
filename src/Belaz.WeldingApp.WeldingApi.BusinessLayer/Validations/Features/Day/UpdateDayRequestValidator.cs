using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;

public class UpdateDayRequestValidator : AbstractValidator<UpdateDayRequest>
{
    public UpdateDayRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateDayRequest, Domain.Entities.CalendarInfo.Day>(context));
        
        RuleFor(model => model.MonthNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(12);
        
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(31);
    }
}