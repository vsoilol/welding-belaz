using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class GetAllByMasterIdRequestValidator : AbstractValidator<GetAllByMasterIdRequest>
{
    public GetAllByMasterIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.MasterId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<GetAllByMasterIdRequest,
                Domain.Entities.Users.Master>(context));

        RuleFor(model => model.Type)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .IsInEnum();
    }
}