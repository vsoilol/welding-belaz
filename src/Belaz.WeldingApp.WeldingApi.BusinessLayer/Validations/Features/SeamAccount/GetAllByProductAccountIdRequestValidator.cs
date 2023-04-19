using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.SeamAccount;

public class GetAllByProductAccountIdRequestValidator
    : AbstractValidator<GetAllByProductAccountIdRequest>
{
    public GetAllByProductAccountIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetAllByProductAccountIdRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccount
                >(context)
            );
    }
}
