using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Seam;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class AssignSeamsToWelderRequestValidator : AbstractValidator<AssignSeamsToWelderRequest>
{
    public AssignSeamsToWelderRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.SeamIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignSeamsToWelderRequest,
                Domain.Entities.ProductInfo.Seam>(context))
            .SetAsyncValidator(new IsWelderAlreadyHasSeamValidatorAssignSeams(context));

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignSeamsToWelderRequest,
                Domain.Entities.Users.Welder>(context));
    }
}