using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.SeamAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.SeamAccount;

public class ChangeSeamAccountDefectiveAmountRequestValidator
    : AbstractValidator<ChangeSeamAccountDefectiveAmountRequest>
{
    public ChangeSeamAccountDefectiveAmountRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.SeamAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ChangeSeamAccountDefectiveAmountRequest,
                    Domain.Entities.ProductInfo.SeamAccount
                >(context)
            );

        RuleFor(model => model.Amount)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new IsDefectiveAmountValidatorForChangeDefectiveAmount(context));
    }
}
