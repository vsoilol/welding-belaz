using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingTask;

public class GetWeldingMaterialInfoByDateRequestValidator : AbstractValidator<GetWeldingMaterialInfoByDateRequest>
{
    public GetWeldingMaterialInfoByDateRequestValidator()
    {
        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GetWeldingMaterialInfoByDateRequest>());
    }
}