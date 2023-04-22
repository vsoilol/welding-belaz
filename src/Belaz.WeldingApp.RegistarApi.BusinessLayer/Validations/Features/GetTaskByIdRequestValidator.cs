using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using FluentValidation;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Features;

public class GetTaskByIdRequestValidator : AbstractValidator<GetTaskByIdRequest>
{
    public GetTaskByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.TaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetTaskByIdRequest, WeldingTask>(context));
        ;

        RuleFor(model => model.WelderRfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new WelderRfidTagValidatorFor<GetTaskByIdRequest>(context));

        RuleFor(model => model.EquipmentRfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new EquipmentRfidTagValidatorFor<GetTaskByIdRequest>(context));
    }
}
