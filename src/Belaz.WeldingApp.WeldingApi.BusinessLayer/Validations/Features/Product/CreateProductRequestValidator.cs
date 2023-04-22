using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class CreateProductRequestValidator : AbstractValidator<CreateProductRequest>
{
    public CreateProductRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Type).Cascade(CascadeMode.Stop).NotEmpty().IsInEnum();

        RuleFor(model => model.Request).Cascade(CascadeMode.Stop).NotNull();

        RuleFor(model => model.Request.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .When(_ => _.Request.Name is not null);

        RuleFor(model => model.Request.Number).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Request.ManufacturingTime)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0);

        RuleFor(model => model.Request.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateProductRequest,
                    Belaz.WeldingApp.Common.Entities.Production.ProductionArea
                >(context)
            );

        RuleFor(model => model.Request.TechnologicalProcessId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateProductRequest,
                    Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalProcess
                >(context)
            );

        RuleFor(model => model.Request.MainProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    CreateProductRequest,
                    Belaz.WeldingApp.Common.Entities.ProductInfo.Product
                >(context)
            )
            .SetAsyncValidator(new MainProductIdValidatorForCreateProductRequest(context))
            .When(_ => _.Type != ProductType.Product);

        RuleFor(model => model.Request.MainProductId)
            .Cascade(CascadeMode.Stop)
            .Null()
            .When(_ => _.Type == ProductType.Product);
    }
}
