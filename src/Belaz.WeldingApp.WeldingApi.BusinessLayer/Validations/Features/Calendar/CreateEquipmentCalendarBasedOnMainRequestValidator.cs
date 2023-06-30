using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateEquipmentCalendarBasedOnMainRequestValidator
    : AbstractValidator<CreateEquipmentCalendarBasedOnMainRequest>
{
    public CreateEquipmentCalendarBasedOnMainRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.EquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<CreateEquipmentCalendarBasedOnMainRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));

        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(
                new MainCalendarIsNotExistValidatorFor<CreateEquipmentCalendarBasedOnMainRequest>(context));


        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new EquipmentCalendarAlreadyExistValidatorFor(context));
    }
}