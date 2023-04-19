using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Day;

public class GetDaysByEquipmentIdRequestValidator : AbstractValidator<GetDaysByEquipmentIdRequest>
{
    public GetDaysByEquipmentIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.EquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetDaysByEquipmentIdRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );
    }
}
