using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class GenerateProductAccountsEmptyRequestValidator
    : AbstractValidator<GenerateProductAccountsEmptyRequest>
{
    public GenerateProductAccountsEmptyRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.NewDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateProductAccountsEmptyRequest>());

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateProductAccountsEmptyRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );
    }
}
