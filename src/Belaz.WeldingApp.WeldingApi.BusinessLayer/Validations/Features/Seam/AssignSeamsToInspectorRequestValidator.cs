using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Seam;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class AssignSeamsToInspectorRequestValidator
    : AbstractValidator<AssignSeamsToInspectorRequest>
{
    public AssignSeamsToInspectorRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.SeamIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignSeamsToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Seam
                >(context)
            )
            .SetAsyncValidator(new IsInspectorAlreadyHasSeamValidatorAssignSeams(context));

        RuleFor(model => model.InspectorId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignSeamsToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Inspector
                >(context)
            );
    }
}
