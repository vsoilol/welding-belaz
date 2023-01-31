using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class UpdateProductWithoutTypeRequestValidator : AbstractValidator<UpdateProductWithoutTypeRequest>
{
    public UpdateProductWithoutTypeRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateProductWithoutTypeRequest,
                Domain.Entities.ProductInfo.Product>(context));

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .When(_ => _.Name is not null);

        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateProductWithoutTypeRequest,
                Domain.Entities.Production.ProductionArea>(context));

        RuleFor(model => model.WorkplaceId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateProductWithoutTypeRequest,
                Domain.Entities.Production.Workplace>(context))
            .When(_ => _.WorkplaceId is not null);

        RuleFor(model => model.TechnologicalProcessId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateProductWithoutTypeRequest,
                Domain.Entities.TaskInfo.TechnologicalProcess>(context));

        When(_ => _.InsideProducts is not null, () =>
        {
            RuleForEach(model => model.InsideProducts)
                .Cascade(CascadeMode.Stop)
                .NotEmpty()
                .SetValidator(new SqlIdValidatorFor<UpdateProductWithoutTypeRequest,
                    Domain.Entities.ProductInfo.Product>(context));
        });

        When(_ => _.Seams is not null, () =>
        {
            RuleForEach(model => model.Seams)
                .Cascade(CascadeMode.Stop)
                .NotEmpty()
                .SetValidator(new SqlIdValidatorFor<UpdateProductWithoutTypeRequest,
                    Domain.Entities.ProductInfo.Seam>(context));
        });
    }
}