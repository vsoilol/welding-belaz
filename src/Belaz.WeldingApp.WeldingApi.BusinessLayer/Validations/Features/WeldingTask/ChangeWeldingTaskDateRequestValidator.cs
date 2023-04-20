using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingTask;

public class ChangeWeldingTaskDateRequestValidator : AbstractValidator<ChangeWeldingTaskDateRequest>
{
    public ChangeWeldingTaskDateRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeWeldingTaskDateRequest,
                    Belaz.WeldingApp.Common.Entities.TaskInfo.WeldingTask
                >(context)
            );

        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<ChangeWeldingTaskDateRequest>());
    }
}
