using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class GetAllByTaskStatusRequestValidator : AbstractValidator<GetAllByTaskStatusRequest>
{
    public GetAllByTaskStatusRequestValidator()
    {
        RuleFor(model => model.Type)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .IsInEnum();

        RuleFor(model => model.Status)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .IsInEnum();
    }
}