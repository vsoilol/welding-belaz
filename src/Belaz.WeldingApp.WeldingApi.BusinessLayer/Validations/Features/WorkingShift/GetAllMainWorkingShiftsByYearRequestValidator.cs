using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class GetAllMainWorkingShiftsByYearRequestValidator : AbstractValidator<GetAllMainWorkingShiftsByYearRequest>
{
    public GetAllMainWorkingShiftsByYearRequestValidator()
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .NotEmpty()
            .SetValidator(new YearValidatorFor<GetAllMainWorkingShiftsByYearRequest>());
    }
}