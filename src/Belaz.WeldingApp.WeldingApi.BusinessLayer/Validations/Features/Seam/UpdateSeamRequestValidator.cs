using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class UpdateSeamRequestValidator : AbstractValidator<UpdateSeamRequest>
{
    public UpdateSeamRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateSeamRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Seam
                >(context)
            );

        RuleFor(model => model.Number).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(1);

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateSeamRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );

        RuleFor(model => model.TechnologicalInstructionId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateSeamRequest,
                    Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction
                >(context)
            )
            .When(_ => _.TechnologicalInstructionId is not null);

        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateSeamRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Product
                >(context)
            );
    }
}
