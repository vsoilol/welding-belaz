using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class AssignSeamToWelderRequestValidator : AbstractValidator<AssignSeamToWelderRequest>
{
    public AssignSeamToWelderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignSeamToWelderRequest,
                Domain.Entities.ProductInfo.Seam>(context));

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignSeamToWelderRequest,
                Domain.Entities.Users.Welder>(context));
    }
}