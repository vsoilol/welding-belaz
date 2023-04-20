using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalProcess;

public class UpdateTechnologicalProcessRequestValidator
    : AbstractValidator<UpdateTechnologicalProcessRequest>
{
    public UpdateTechnologicalProcessRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateTechnologicalProcessRequest,
                    Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalProcess
                >(context)
            );

        RuleFor(model => model.Number).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Name).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.PdmSystemFileLink).Cascade(CascadeMode.Stop).NotEmpty();
    }
}
