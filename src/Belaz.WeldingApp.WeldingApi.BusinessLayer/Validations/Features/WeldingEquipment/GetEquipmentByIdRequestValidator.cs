using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class GetEquipmentByIdRequestValidator : AbstractValidator<GetEquipmentByIdRequest>
{
    public GetEquipmentByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GetEquipmentByIdRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment>(context)
            );
    }
}