using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;

public class MainProductIdValidatorForCreateProductRequest
    : AsyncPropertyValidator<CreateProductRequest, Guid>
{
    private readonly ApplicationContext _context;

    public MainProductIdValidatorForCreateProductRequest(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<CreateProductRequest> context,
        Guid value,
        CancellationToken cancellation
    )
    {
        var product = await _context.Products.FindAsync(value);

        if (product == null)
        {
            return false;
        }

        if (
            context.InstanceToValidate.Type == ProductType.Knot
            && product.ProductType == ProductType.Detail
        )
        {
            return false;
        }

        return true;
    }

    public override string Name => "MainProductIdValidatorForCreateProductRequest";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "MainProduct Id is not valid";
}
