using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Workplace;

public class CreateWorkplaceRequestValidator : AbstractValidator<CreateWorkplaceRequest>
{
    public CreateWorkplaceRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .Null()
            .When(_ => _.PostId is not null);

        RuleFor(model => model.PostId)
            .Cascade(CascadeMode.Stop)
            .Null()
            .When(_ => _.ProductionAreaId is not null);

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .When(_ => _.PostId is null);

        RuleFor(model => model.PostId)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .When(_ => _.ProductionAreaId is null);

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateWorkplaceRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            )
            .When(_ => _.ProductionAreaId is not null && _.PostId is null);

        RuleFor(model => model.PostId)
            .Cascade(CascadeMode.Stop)
            .NotNull()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateWorkplaceRequest,
                    Belaz.WeldingApp.Common.Entities.Production.Post
                >(context)
            )
            .When(_ => _.PostId is not null && _.ProductionAreaId is null);
    }
}
