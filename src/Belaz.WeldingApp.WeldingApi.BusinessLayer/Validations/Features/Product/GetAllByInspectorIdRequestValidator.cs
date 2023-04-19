using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class GetAllByInspectorIdRequestValidator : AbstractValidator<GetAllByInspectorIdRequest>
{
    public GetAllByInspectorIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.InspectorId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GetAllByInspectorIdRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Inspector
                >(context)
            );

        RuleFor(model => model.Type).Cascade(CascadeMode.Stop).NotEmpty().IsInEnum();
    }
}
