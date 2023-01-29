using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalProcess;

public class CreateTechnologicalProcessRequestValidator : AbstractValidator<CreateTechnologicalProcessRequest>
{
    public CreateTechnologicalProcessRequestValidator()
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);
        
        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
        
        RuleFor(model => model.PdmSystemFileLink)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
    }
}