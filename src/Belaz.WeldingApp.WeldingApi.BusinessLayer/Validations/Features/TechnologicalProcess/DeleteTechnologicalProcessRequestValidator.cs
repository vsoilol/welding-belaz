using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalProcess;

public class DeleteTechnologicalProcessRequestValidator
    : AbstractValidator<DeleteTechnologicalProcessRequest>
{
    public DeleteTechnologicalProcessRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteTechnologicalProcessRequest,
                    Domain.Entities.TechnologicalProcessInfo.TechnologicalProcess
                >(context)
            );
    }
}
