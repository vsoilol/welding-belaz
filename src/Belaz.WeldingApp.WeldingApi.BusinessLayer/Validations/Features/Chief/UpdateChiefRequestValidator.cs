using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Chief;

public class UpdateChiefRequestValidator : AbstractValidator<UpdateChiefRequest>
{
    public UpdateChiefRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateChiefRequest,
                    Belaz.WeldingApp.Common.Entities.Users.Chief
                >(context)
            );

        RuleFor(model => model.RfidTag).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.FirstName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.LastName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.MiddleName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.WorkshopId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateChiefRequest,
                    Belaz.WeldingApp.Common.Entities.Production.Workshop
                >(context)
            );
    }
}
