using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workplace;

public class GetWorkplaceByIdRequestValidator : AbstractValidator<GetWorkplaceByIdRequest>
{
    public GetWorkplaceByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetWorkplaceByIdRequest,
                Domain.Entities.Production.Workplace>(context));
    }
}