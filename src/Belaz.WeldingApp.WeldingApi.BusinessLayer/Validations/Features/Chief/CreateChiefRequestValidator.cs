using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Chief;

public class CreateChiefRequestValidator : AbstractValidator<CreateChiefRequest>
{
    public CreateChiefRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.FirstName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.LastName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.MiddleName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.WorkshopId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreateChiefRequest,
                Belaz.WeldingApp.Common.Entities.Production.Workshop>(context));
    }
}