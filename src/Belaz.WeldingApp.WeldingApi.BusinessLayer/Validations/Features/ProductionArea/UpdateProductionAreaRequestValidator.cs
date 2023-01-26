using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductionArea;

public class UpdateProductionAreaRequestValidator : AbstractValidator<UpdateProductionAreaRequest>
{
    public UpdateProductionAreaRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateProductionAreaRequest,
                Domain.Entities.Production.ProductionArea>(context));
        
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
        
        RuleFor(model => model.WorkshopId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateProductionAreaRequest,
                Domain.Entities.Production.Workshop>(context));
    }
}