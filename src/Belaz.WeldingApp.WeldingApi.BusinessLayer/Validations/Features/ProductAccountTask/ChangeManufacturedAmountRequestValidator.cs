using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccountTask;

public class ChangeManufacturedAmountRequestValidator : AbstractValidator<ChangeManufacturedAmountRequest>
{
    public ChangeManufacturedAmountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeManufacturedAmountRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask
                >(context)
            );

        RuleFor(model => model.ManufacturedAmount)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0);
    }
}