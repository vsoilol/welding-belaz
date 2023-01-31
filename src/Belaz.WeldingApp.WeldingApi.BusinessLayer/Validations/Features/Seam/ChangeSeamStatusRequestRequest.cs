using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class ChangeSeamStatusRequestRequest : AbstractValidator<ChangeSeamStatusRequest>
{
    public ChangeSeamStatusRequestRequest(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<ChangeSeamStatusRequest,
                Domain.Entities.ProductInfo.Seam>(context));

        RuleFor(model => model.Status)
            .Cascade(CascadeMode.Stop)
            .IsInEnum();
    }
}