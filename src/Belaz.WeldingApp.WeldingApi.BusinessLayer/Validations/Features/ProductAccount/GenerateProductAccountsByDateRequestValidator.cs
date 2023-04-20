using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class GenerateProductAccountsByDateRequestValidator
    : AbstractValidator<GenerateProductAccountsByDateRequest>
{
    public GenerateProductAccountsByDateRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateProductAccountsByDateRequest>())
            .SetAsyncValidator(
                new ExistDateValidatorFor<GenerateProductAccountsByDateRequest>(context)
            );

        RuleFor(model => model.NewDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateProductAccountsByDateRequest>());

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateProductAccountsByDateRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );
    }
}
