using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class
    IsProductAccountIsExistWithoutUniqueNumberPropertyValidator : AsyncPropertyValidator<AddProductAccountRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsProductAccountIsExistWithoutUniqueNumberPropertyValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<AddProductAccountRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var date = context.InstanceToValidate.Date.ToDateTime();

        var isExist = await _context.ProductAccounts
            .AnyAsync(_ => _.ProductId == value
                           && _.DateFromPlan == date
                           && _.UniqueNumber == null,
                cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsProductAccountIsExistWithoutUniqueNumberPropertyValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Product account with this product already exist";
}