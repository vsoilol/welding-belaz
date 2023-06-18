using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingTask;

public class UpdateWeldingMaterialInfoByDateRequestValidator : AbstractValidator<UpdateWeldingMaterialInfoByDateRequest>
{
    public UpdateWeldingMaterialInfoByDateRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateWeldingMaterialInfoByDateRequest>())
            .SetAsyncValidator(new IsTasksByDateExistsValidator<UpdateWeldingMaterialInfoByDateRequest>(context));
    }
}