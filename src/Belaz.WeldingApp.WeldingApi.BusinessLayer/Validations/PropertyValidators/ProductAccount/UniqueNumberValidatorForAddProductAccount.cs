using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class UniqueNumberValidatorForAddProductAccount : AsyncPropertyValidator<AddProductAccountRequest, int?>
{
    private readonly ApplicationContext _context;

    public UniqueNumberValidatorForAddProductAccount(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<AddProductAccountRequest> context, int? value,
        CancellationToken cancellation)
    {
        var date = context.InstanceToValidate.Date.ToDateTime();

        var isExist = await _context.ProductAccounts
            .Where(_ => _.DateFromPlan == date && _.ProductId == context.InstanceToValidate.ProductId)
            .AnyAsync(_ => _.UniqueNumber == value, cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "UniqueNumberValidatorForAddProductAccount";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "This number already exist";
}