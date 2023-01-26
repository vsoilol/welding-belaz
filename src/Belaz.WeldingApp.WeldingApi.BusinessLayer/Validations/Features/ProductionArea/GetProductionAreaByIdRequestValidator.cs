using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductionArea;

public class GetProductionAreaByIdRequestValidator : AbstractValidator<GetProductionAreaByIdRequest>
{
    public GetProductionAreaByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetProductionAreaByIdRequest,
                Domain.Entities.Production.ProductionArea>(context));
    }
}