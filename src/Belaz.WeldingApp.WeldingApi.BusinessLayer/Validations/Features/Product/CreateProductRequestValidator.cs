using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class CreateProductRequestValidator : AbstractValidator<CreateProductRequest>
{
    public CreateProductRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Type)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .IsInEnum();

        RuleFor(model => model.Request)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .SetValidator(new CreateProductWithoutTypeRequestValidator(context));
    }
}