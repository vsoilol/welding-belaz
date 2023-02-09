using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class GetAllProductsRequestValidator : AbstractValidator<GetAllProductsRequest>
{
    public GetAllProductsRequestValidator()
    {
        RuleFor(model => model.Type)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .IsInEnum();
    }
}