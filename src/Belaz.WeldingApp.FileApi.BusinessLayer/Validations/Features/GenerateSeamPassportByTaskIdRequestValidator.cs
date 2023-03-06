using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.TaskInfo;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features;

public class GenerateSeamPassportByTaskIdRequestValidator
    : AbstractValidator<GenerateSeamPassportByTaskIdRequest>
{
    public GenerateSeamPassportByTaskIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.TaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateSeamPassportByTaskIdRequest, WeldingTask>(context)
            );
    }
}
