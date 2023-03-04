using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using FluentValidation;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Features;

public class SetweldingTaskStatusToExecutionAcceptedRequestValidator
    : AbstractValidator<SetWeldingTaskStatusToExecutionAcceptedRequest>
{
    public SetweldingTaskStatusToExecutionAcceptedRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingTaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<SetWeldingTaskStatusToExecutionAcceptedRequest, WeldingTask>(
                    context
                )
            );
    }
}
