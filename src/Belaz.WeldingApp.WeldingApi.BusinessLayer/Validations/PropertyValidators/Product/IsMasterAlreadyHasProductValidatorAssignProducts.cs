using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Product;

public class IsMasterAlreadyHasProductValidatorAssignProducts : AsyncPropertyValidator<AssignProductsToMasterRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsMasterAlreadyHasProductValidatorAssignProducts(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<AssignProductsToMasterRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Products
            .AnyAsync(_ => _.MasterId == context.InstanceToValidate.MasterId
                           && _.Id == value, cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsMasterAlreadyHasProductValidatorAssignProducts";
    
    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This product is already assign to master";
}