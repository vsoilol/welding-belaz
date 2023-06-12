using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class GetAllWorkingShiftsByEquipmentIdAndYearRequestValidator :
    AbstractValidator<GetAllWorkingShiftsByEquipmentIdAndYearRequest>
{
    public GetAllWorkingShiftsByEquipmentIdAndYearRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .NotEmpty()
            .SetValidator(new YearValidatorFor<GetAllWorkingShiftsByEquipmentIdAndYearRequest>());

        RuleFor(model => model.EquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetAllWorkingShiftsByEquipmentIdAndYearRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );
    }
}