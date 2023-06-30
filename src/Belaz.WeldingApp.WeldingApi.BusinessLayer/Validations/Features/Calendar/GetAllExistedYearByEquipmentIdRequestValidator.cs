using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class GetAllExistedYearByEquipmentIdRequestValidator : AbstractValidator<GetAllExistedYearByEquipmentIdRequest>
{
    public GetAllExistedYearByEquipmentIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.EquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetAllExistedYearByEquipmentIdRequest,
                    Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );
    }
}