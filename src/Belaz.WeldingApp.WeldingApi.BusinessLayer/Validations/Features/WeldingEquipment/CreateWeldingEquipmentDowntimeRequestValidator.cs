using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class CreateWeldingEquipmentDowntimeRequestValidator : AbstractValidator<CreateWeldingEquipmentDowntimeRequest>
{
    public CreateWeldingEquipmentDowntimeRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreateWeldingEquipmentDowntimeRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));

        RuleFor(model => model.DowntimeReasonId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreateWeldingEquipmentDowntimeRequest, DowntimeReason>(context));

        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<CreateWeldingEquipmentDowntimeRequest>());

        RuleFor(model => model.StartConditionTime)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<CreateWeldingEquipmentDowntimeRequest>());
        
        RuleFor(model => model.Time)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);
    }
}