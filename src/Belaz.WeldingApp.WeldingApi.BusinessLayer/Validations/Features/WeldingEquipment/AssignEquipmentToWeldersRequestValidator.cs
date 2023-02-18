using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class AssignEquipmentToWeldersRequestValidator : AbstractValidator<AssignEquipmentsToWeldersRequest>
{
    public AssignEquipmentToWeldersRequestValidator(ApplicationContext context)
    {
        RuleForEach(model => model.WeldingEquipmentIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignEquipmentsToWeldersRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));
        
        RuleForEach(model => model.WelderIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignEquipmentsToWeldersRequest,
                Domain.Entities.Users.Welder>(context));
    }
}