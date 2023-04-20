using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Inspector;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Inspector;

public class UpdateInspectorRequestValidator : AbstractValidator<UpdateInspectorRequest>
{
    public UpdateInspectorRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateInspectorRequest, Belaz.WeldingApp.Common.Entities.Users.Inspector>(
                    context
                )
            );

        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new IsInspectorRfidTagUniqueValidatorForUpdate(context))
            .NotEmpty();

        RuleFor(model => model.FirstName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.LastName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.MiddleName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateInspectorRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );
    }
}
