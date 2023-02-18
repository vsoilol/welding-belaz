using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Seam;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class AddDefectiveReasonToSeamRequestValidator : AbstractValidator<AddDefectiveReasonToSeamRequest>
{
    public AddDefectiveReasonToSeamRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Reason)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.WeldingTaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AddDefectiveReasonToSeamRequest,
                Domain.Entities.TaskInfo.WeldingTask>(context))
            .SetAsyncValidator(new IsDefectiveReasonAlreadyExistValidatorForAddDefectiveReason(context));

        RuleFor(model => model.DetectedDefectiveDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<AddDefectiveReasonToSeamRequest>());
    }
}