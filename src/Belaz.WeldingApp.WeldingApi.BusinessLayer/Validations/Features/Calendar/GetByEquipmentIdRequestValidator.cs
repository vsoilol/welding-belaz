using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class GetByEquipmentIdRequestValidator : AbstractValidator<GetByEquipmentIdRequest>
{
    public GetByEquipmentIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new YearValidatorFor<GetByEquipmentIdRequest>());

        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetByEquipmentIdRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));
    }
}