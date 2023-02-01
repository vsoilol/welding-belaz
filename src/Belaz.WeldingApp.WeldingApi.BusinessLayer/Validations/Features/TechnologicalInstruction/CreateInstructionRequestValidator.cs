using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldPassageInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalInstruction;

public class CreateInstructionRequestValidator : AbstractValidator<CreateInstructionRequest>
{
    public CreateInstructionRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(new SeamIdValidatorForCreateInstruction(context));

        RuleFor(model => model.TechnologicalProcessId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreateInstructionRequest,
                Domain.Entities.TechnologicalProcessInfo.TechnologicalProcess>(context));

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);
        
        RuleFor(model => model.WeldPassages)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .NotEmpty();

        RuleForEach(model => model.WeldPassages)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new CreateWeldPassageInstructionRequestValidator());
    }
}