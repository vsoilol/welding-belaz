using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Post;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Post;

public class CreatePostRequestValidator : AbstractValidator<CreatePostRequest>
{
    public CreatePostRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreatePostRequest,
                Domain.Entities.Production.ProductionArea>(context));
    }
}