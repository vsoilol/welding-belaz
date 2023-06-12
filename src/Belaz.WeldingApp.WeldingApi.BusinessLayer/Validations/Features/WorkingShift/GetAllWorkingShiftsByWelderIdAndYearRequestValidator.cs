using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WorkingShift;

public class GetAllWorkingShiftsByWelderIdAndYearRequestValidator :
    AbstractValidator<GetAllWorkingShiftsByWelderIdAndYearRequest>
{
    public GetAllWorkingShiftsByWelderIdAndYearRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .NotEmpty()
            .SetValidator(new YearValidatorFor<GetAllWorkingShiftsByWelderIdAndYearRequest>());

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetAllWorkingShiftsByWelderIdAndYearRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Welder
                >(context)
            );
    }
}