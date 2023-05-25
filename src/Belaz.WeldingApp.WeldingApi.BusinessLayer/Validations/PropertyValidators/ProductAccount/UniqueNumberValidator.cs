using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class UniqueNumberValidator : AsyncPropertyValidator<SetUniqueNumberForProductRequest, int?>
{
    private readonly ApplicationContext _context;

    public UniqueNumberValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<SetUniqueNumberForProductRequest> context,
        int? value, CancellationToken cancellation)
    {
        var productAccount =
            await _context.ProductAccounts.FirstOrDefaultAsync(_ =>
                    _.Id == context.InstanceToValidate.ProductAccountId,
                cancellationToken: cancellation);

        if (productAccount is null)
        {
            return false;
        }

        var isExist = await _context.ProductAccounts
            .Where(_ => _.DateFromPlan == productAccount.DateFromPlan && _.ProductId == productAccount.ProductId)
            .AnyAsync(_ => _.UniqueNumber == value && _.Id != productAccount.Id,
                cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "UniqueNumberValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "This number already exist";
}