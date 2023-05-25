using Belaz.WeldingApp.Common.Entities;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class IsProductEqualsForTypeValidatorFor<T> : AsyncPropertyValidator<T, Guid>
{
    private readonly ApplicationContext _context;
    private readonly ProductType _productType;

    public IsProductEqualsForTypeValidatorFor(ApplicationContext context, ProductType productType)
    {
        _context = context;
        _productType = productType;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, Guid value,
        CancellationToken cancellation)
    {
        var product = await _context.Products
            .FirstOrDefaultAsync(_ => _.Id == value, cancellationToken: cancellation);

        if (product is null)
        {
            return false;
        }

        return product.ProductType == _productType;
    }

    public override string Name => "IsProductEqualsForTypeValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        $"Is not a valid product, must be {_productType}";
}