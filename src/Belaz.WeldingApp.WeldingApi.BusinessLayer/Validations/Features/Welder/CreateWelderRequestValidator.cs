using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Welder;

public class CreateWelderRequestValidator : AbstractValidator<CreateWelderRequest>
{
    public CreateWelderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(
                new IsRfidTagExistValidatorFor<
                    CreateWelderRequest,
                    Belaz.WeldingApp.Common.Entities.IdentityUser.UserData
                >(context)
            );

        RuleFor(model => model.FirstName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.LastName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.MiddleName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.ServiceNumber)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.Position)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateWelderRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );

        RuleFor(model => model.WorkplaceId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateWelderRequest,
                    Belaz.WeldingApp.Common.Entities.Production.Workplace
                >(context)
            )
            .When(_ => _.WorkplaceId is not null);
    }
}
