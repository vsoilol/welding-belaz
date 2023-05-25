using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class
    IsProductAccountContainProductPropertyValidator : AsyncPropertyValidator<SetUniqueNumberForProductRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsProductAccountContainProductPropertyValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<SetUniqueNumberForProductRequest> context,
        Guid value,
        CancellationToken cancellation)
    {
        var isExits = await _context.Products
            .AnyAsync(_ => _.ProductAccounts
                               .Any(account => account.Id == value) &&
                           _.ProductType == ProductType.Product, cancellationToken: cancellation);

        return isExits;
    }

    public override string Name => "IsProductAccountContainProductPropertyValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "This product account is not for product";
}