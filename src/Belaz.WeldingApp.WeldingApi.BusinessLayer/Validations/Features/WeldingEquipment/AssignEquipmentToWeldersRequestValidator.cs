using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class AssignEquipmentToWeldersRequestValidator : AbstractValidator<AssignEquipmentToWeldersRequest>
{
    public AssignEquipmentToWeldersRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignEquipmentToWeldersRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));
        
        RuleForEach(model => model.WelderIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AssignEquipmentToWeldersRequest,
                Domain.Entities.Users.Welder>(context));
    }
}