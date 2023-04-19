using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class AssignSeamToInspectorRequestValidator : AbstractValidator<AssignSeamToInspectorRequest>
{
    public AssignSeamToInspectorRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignSeamToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Seam
                >(context)
            );

        RuleFor(model => model.InspectorId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignSeamToInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Inspector
                >(context)
            );
    }
}
