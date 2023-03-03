using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.ProductAccount;

public class AssignProductAccountToWeldersRequestValidator
    : AbstractValidator<AssignProductAccountToWeldingEquipmentsRequest>
{
    public AssignProductAccountToWeldersRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductAccountId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductAccountToWeldingEquipmentsRequest,
                    Domain.Entities.ProductInfo.ProductAccount
                >(context)
            );

        RuleForEach(model => model.WeldingEquipmentIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignProductAccountToWeldingEquipmentsRequest,
                    Domain.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );
    }
}
