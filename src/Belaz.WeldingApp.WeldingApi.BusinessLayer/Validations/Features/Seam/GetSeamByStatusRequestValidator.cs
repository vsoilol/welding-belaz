using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class GetSeamByStatusRequestValidator : AbstractValidator<GetSeamByStatusRequest>
{
    public GetSeamByStatusRequestValidator()
    {
        RuleFor(model => model.Status)
            .Cascade(CascadeMode.Stop)
            .IsInEnum();
    }
}