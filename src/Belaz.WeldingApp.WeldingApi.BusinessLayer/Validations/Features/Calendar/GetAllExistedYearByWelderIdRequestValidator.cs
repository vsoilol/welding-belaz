using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Calendar;

public class GetAllExistedYearByWelderIdRequestValidator : AbstractValidator<GetAllExistedYearByWelderIdRequest>
{
    public GetAllExistedYearByWelderIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetAllExistedYearByWelderIdRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Welder
                >(context)
            );
    }
}