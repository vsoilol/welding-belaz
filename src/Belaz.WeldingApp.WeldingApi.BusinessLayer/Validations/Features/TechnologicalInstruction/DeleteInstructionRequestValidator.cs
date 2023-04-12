using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalInstruction;

public class DeleteInstructionRequestValidator : AbstractValidator<DeleteInstructionRequest>
{
    public DeleteInstructionRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteInstructionRequest,
                    Domain.Entities.TechnologicalProcessInfo.TechnologicalInstruction
                >(context)
            );
    }
}
