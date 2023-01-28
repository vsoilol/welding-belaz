using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workshop;

public class UpdateWorkshopRequestValidator : AbstractValidator<UpdateWorkshopRequest>
{
    public UpdateWorkshopRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateWorkshopRequest,
                Domain.Entities.Production.Workshop>(context));

        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
    }
}