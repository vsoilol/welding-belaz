using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccountTask;

public class UpdateWeldingMaterialInfoRequestValidator : AbstractValidator<UpdateWeldingMaterialInfoRequest>
{
    public UpdateWeldingMaterialInfoRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateWeldingMaterialInfoRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask
                >(context)
            );
    }
}