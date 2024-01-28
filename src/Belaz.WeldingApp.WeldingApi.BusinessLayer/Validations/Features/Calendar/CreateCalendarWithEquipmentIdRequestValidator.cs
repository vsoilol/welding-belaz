using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using FluentValidation;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class CreateCalendarWithEquipmentIdRequestValidator : AbstractValidator<CreateCalendarWithEquipmentIdRequest>
{
    public CreateCalendarWithEquipmentIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<CreateCalendarWithEquipmentIdRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new EquipmentYearValidatorFor(context));

        When(model => model.MainWorkingShift is not null && model.MainWorkingShift.Any(),
            () =>
            {
                RuleForEach(model => model.MainWorkingShift)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new CreateWorkingShiftRequestValidator());
            });

        When(_ => _.Days is not null,
            () =>
            {
                RuleForEach(model => model.Days)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new CreateDayRequestValidator());
            });
    }
}