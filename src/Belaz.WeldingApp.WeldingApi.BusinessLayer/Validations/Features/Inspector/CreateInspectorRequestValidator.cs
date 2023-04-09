using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Inspector;

public class CreateInspectorRequestValidator : AbstractValidator<CreateInspectorRequest>
{
    public CreateInspectorRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(
                new IsRfidTagExistValidatorFor<
                    CreateInspectorRequest,
                    Domain.Entities.IdentityUser.UserData
                >(context)
            );

        RuleFor(model => model.ServiceNumber).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Position).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.FirstName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.LastName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.MiddleName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateInspectorRequest,
                    Domain.Entities.Production.ProductionArea
                >(context)
            );
    }
}
