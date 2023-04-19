using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Master;

public class DeleteMasterRequestValidator : AbstractValidator<DeleteMasterRequest>
{
    public DeleteMasterRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    DeleteMasterRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Master
                >(context)
            );
    }
}
