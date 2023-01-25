using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Chief;

public class CreateChiefRequestValidation: AbstractValidator<CreateChiefRequest>
{
    public CreateChiefRequestValidation(ApplicationContext context)
    {
        RuleFor(x => x.ProductionAreaId)
            .Cascade(CascadeMode.StopOnFirstFailure)
            .SetValidator(new SqlIdValidatorFor<CreateChiefRequest, ProductionArea>(context));
    }
}