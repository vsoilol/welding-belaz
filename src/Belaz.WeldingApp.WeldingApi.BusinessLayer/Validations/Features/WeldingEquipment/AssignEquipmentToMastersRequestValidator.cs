using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class AssignEquipmentToMastersRequestValidator
    : AbstractValidator<AssignEquipmentsToMastersRequest>
{
    public AssignEquipmentToMastersRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.WeldingEquipmentIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignEquipmentsToMastersRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );

        RuleFor(model => model.MasterId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    AssignEquipmentsToMastersRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Master
                >(context)
            );
    }
}
