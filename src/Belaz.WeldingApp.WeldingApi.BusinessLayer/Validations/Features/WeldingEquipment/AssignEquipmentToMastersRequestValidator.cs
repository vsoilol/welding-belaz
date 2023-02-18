using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class AssignEquipmentToMastersRequestValidator : AbstractValidator<AssignEquipmentToMastersRequest>
{
    public AssignEquipmentToMastersRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignEquipmentToMastersRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));
        
        RuleForEach(model => model.MasterIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignEquipmentToMastersRequest,
                Domain.Entities.Users.Master>(context));
    }
}