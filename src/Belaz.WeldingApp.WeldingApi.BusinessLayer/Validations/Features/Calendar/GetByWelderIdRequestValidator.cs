using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Users;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class GetByWelderIdRequestValidator : AbstractValidator<GetByWelderIdRequest>
{
    public GetByWelderIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Year)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new YearValidatorFor<GetByWelderIdRequest>());

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetByWelderIdRequest, Welder>(context));
    }
}