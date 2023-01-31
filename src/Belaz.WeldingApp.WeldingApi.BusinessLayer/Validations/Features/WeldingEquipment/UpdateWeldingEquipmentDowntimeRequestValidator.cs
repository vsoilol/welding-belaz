using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class UpdateWeldingEquipmentDowntimeRequestValidator : AbstractValidator<UpdateWeldingEquipmentDowntimeRequest>
{
    public UpdateWeldingEquipmentDowntimeRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateWeldingEquipmentDowntimeRequest,
                WeldingEquipmentConditionTime>(context));

        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateWeldingEquipmentDowntimeRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));

        RuleFor(model => model.DowntimeReasonId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateWeldingEquipmentDowntimeRequest, DowntimeReason>(context));

        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateWeldingEquipmentDowntimeRequest>());

        RuleFor(model => model.StartConditionTime)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new TimeValidatorFor<UpdateWeldingEquipmentDowntimeRequest>());

        RuleFor(model => model.Time)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);
    }
}