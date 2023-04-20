using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductionArea;

public class DeleteProductionAreaRequestValidator : AbstractValidator<DeleteProductionAreaRequest>
{
    public DeleteProductionAreaRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteProductionAreaRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );
    }
}
