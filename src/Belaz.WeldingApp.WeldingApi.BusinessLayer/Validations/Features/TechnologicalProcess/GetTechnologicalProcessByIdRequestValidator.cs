using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalProcess;

public class GetTechnologicalProcessByIdRequestValidator : AbstractValidator<GetTechnologicalProcessByIdRequest>
{
    public GetTechnologicalProcessByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetTechnologicalProcessByIdRequest,
                Domain.Entities.TechnologicalProcessInfo.TechnologicalProcess>(context));
    }
}