using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class CreateSeamRequestValidator : AbstractValidator<CreateSeamRequest>
{
    public CreateSeamRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Number).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(1);

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<CreateSeamRequest, Domain.Entities.Production.ProductionArea>(
                    context
                )
            );

        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<CreateSeamRequest, Domain.Entities.ProductInfo.Product>(
                    context
                )
            );

        RuleFor(model => model.TechnologicalInstructionId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateSeamRequest,
                    Domain.Entities.TechnologicalProcessInfo.TechnologicalInstruction
                >(context)
            )
            .When(_ => _.TechnologicalInstructionId is not null);
    }
}
