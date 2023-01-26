using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workshop;

public class CreateWorkshopRequestValidator : AbstractValidator<CreateWorkshopRequest>
{
    public CreateWorkshopRequestValidator()
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
    }
}