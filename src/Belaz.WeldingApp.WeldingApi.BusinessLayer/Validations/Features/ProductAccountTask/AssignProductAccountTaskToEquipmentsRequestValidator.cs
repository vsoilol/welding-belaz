using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccountTask;

public class AssignProductAccountTaskToEquipmentsRequestValidator
    : AbstractValidator<AssignProductAccountTaskToWeldingEquipmentsRequest>
{
    public AssignProductAccountTaskToEquipmentsRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountTaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductAccountTaskToWeldingEquipmentsRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.ProductAccountTask
                >(context)
            );

        RuleForEach(model => model.WeldingEquipmentIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductAccountTaskToWeldingEquipmentsRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );
    }
}