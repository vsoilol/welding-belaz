using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class GetAllProductsByWelderIdRequestValidator : AbstractValidator<GetAllProductsByWelderIdRequest>
{
    public GetAllProductsByWelderIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetAllProductsByWelderIdRequest,
                Domain.Entities.Users.Welder>(context));
        
        RuleFor(model => model.Type)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .IsInEnum();
    }
}