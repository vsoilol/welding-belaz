using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class ChangeProductStatusRequestValidator : AbstractValidator<ChangeProductStatusRequest>
{
    public ChangeProductStatusRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<ChangeProductStatusRequest,
                Domain.Entities.ProductInfo.Product>(context));
        
        RuleFor(model => model.Status)
            .Cascade(CascadeMode.Stop)
            .IsInEnum();
    }
}