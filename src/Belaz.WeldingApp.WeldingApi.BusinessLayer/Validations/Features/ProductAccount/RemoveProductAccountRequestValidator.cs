using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class RemoveProductAccountRequestValidator : AbstractValidator<RemoveProductAccountRequest>
{
    public RemoveProductAccountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    RemoveProductAccountRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );
    }
}