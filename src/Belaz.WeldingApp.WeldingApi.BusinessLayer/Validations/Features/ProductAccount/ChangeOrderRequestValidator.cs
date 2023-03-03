using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class ChangeOrderRequestValidator : AbstractValidator<ChangeOrderRequest>
{
    public ChangeOrderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.FirstId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeOrderRequest,
                    Domain.Entities.ProductInfo.ProductAccount
                >(context)
            );

        RuleFor(model => model.SecondId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeOrderRequest,
                    Domain.Entities.ProductInfo.ProductAccount
                >(context)
            );
    }
}
