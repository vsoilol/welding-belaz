using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Features;

public class RecordWithTaskRequestValidator : AbstractValidator<RecordWithTaskRequest>
{
    public RecordWithTaskRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RegistarId).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<RecordWithTaskRequest, WeldingEquipment>(context));

        RuleFor(model => model.TaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<RecordWithTaskRequest, WeldingTask>(context));

        RuleFor(model => model.WeldPassageNumber).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(1);

        RuleFor(model => model.PreheatingTemperature)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0);

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<RecordWithTaskRequest, Welder>(context));

        RuleFor(model => model.StartDateTime).Cascade(CascadeMode.Stop).NotEmpty();

        RuleForEach(model => model.Amperages).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(0);

        RuleForEach(model => model.Voltages).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(0);
    }
}
