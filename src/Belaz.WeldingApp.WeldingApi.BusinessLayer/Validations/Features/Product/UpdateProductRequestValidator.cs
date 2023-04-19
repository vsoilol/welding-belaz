using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Product;

public class UpdateProductRequestValidator : AbstractValidator<UpdateProductRequest>
{
    public UpdateProductRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Type).Cascade(CascadeMode.Stop).NotEmpty().IsInEnum();

        RuleFor(model => model.Request).Cascade(CascadeMode.Stop).NotNull();

        RuleFor(model => model.Request.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateProductRequest, Domain.Entities.ProductInfo.Product>(
                    context
                )
            );

        RuleFor(model => model.Request.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .When(_ => _.Request.Name is not null);

        RuleFor(model => model.Request.Number).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Request.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateProductRequest,
                    Domain.Entities.Production.ProductionArea
                >(context)
            );

        RuleFor(model => model.Request.TechnologicalProcessId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateProductRequest,
                    Domain.Entities.TechnologicalProcessInfo.TechnologicalProcess
                >(context)
            );

        RuleFor(model => model.Request.MainProductId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateProductRequest, Domain.Entities.ProductInfo.Product>(
                    context
                )
            )
            .SetAsyncValidator(new MainProductIdValidatorForUpdateProductRequest(context))
            .NotEqual(_ => _.Request.Id)
            .When(_ => _.Type != ProductType.Product);

        RuleFor(model => model.Request.MainProductId)
            .Cascade(CascadeMode.Stop)
            .Null()
            .When(_ => _.Type == ProductType.Product);
    }
}
