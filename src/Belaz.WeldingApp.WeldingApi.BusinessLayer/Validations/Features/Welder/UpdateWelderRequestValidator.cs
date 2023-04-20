using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Welder;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Welder;

public class UpdateWelderRequestValidator : AbstractValidator<UpdateWelderRequest>
{
    public UpdateWelderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateWelderRequest, Belaz.WeldingApp.Common.Entities.Users.Welder>(context)
            );

        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new IsWelderRfidTagUniqueValidatorForUpdate(context))
            .NotEmpty();

        RuleFor(model => model.FirstName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.LastName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.MiddleName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.ServiceNumber).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Position).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateWelderRequest, Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );

        RuleFor(model => model.WorkplaceId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateWelderRequest, Belaz.WeldingApp.Common.Entities.Production.Workplace>(
                    context
                )
            )
            .When(_ => _.WorkplaceId is not null);
    }
}
