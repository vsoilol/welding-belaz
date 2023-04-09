using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Master;

public class CreateMasterRequestValidator : AbstractValidator<CreateMasterRequest>
{
    public CreateMasterRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(
                new IsRfidTagExistValidatorFor<
                    CreateMasterRequest,
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
                    CreateMasterRequest,
                    Domain.Entities.Production.ProductionArea
                >(context)
            );
    }
}
