using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Post;

public class GetPostByIdRequestValidator : AbstractValidator<GetPostByIdRequest>
{
    public GetPostByIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetPostByIdRequest,
                Domain.Entities.Production.Post>(context));
    }
}