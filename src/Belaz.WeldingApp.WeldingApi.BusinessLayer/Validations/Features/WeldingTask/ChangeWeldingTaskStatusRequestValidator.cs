using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingTask;

public class ChangeWeldingTaskStatusRequestValidator
    : AbstractValidator<ChangeWeldingTaskStatusRequest>
{
    public ChangeWeldingTaskStatusRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeWeldingTaskStatusRequest,
                    Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingTask
                >(context)
            );

        RuleFor(model => model.Status).Cascade(CascadeMode.Stop).IsInEnum();
    }
}
