using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;

public class
    IsInspectorAlreadyHasProductValidatorAssignProducts : AsyncPropertyValidator<AssignProductsToInspectorRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsInspectorAlreadyHasProductValidatorAssignProducts(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<AssignProductsToInspectorRequest> context,
        Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Products
            .AnyAsync(_ => _.InspectorId == context.InstanceToValidate.InspectorId
                           && _.Id == value, cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsInspectorAlreadyHasProductValidatorAssignProducts";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This product is already assign to inspector";
}