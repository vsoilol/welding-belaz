using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class IsAcceptedAmountCorrectValidatorForChangeAmount
    : AsyncPropertyValidator<ChangeProductAccountAcceptedAmountRequest, int>
{
    private readonly ApplicationContext _context;

    public IsAcceptedAmountCorrectValidatorForChangeAmount(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<ChangeProductAccountAcceptedAmountRequest> context,
        int value,
        CancellationToken cancellation
    )
    {
        var manufacturedProductResult = await _context.ProductResults.FirstOrDefaultAsync(
            _ =>
                _.ProductAccountId == context.InstanceToValidate.Id
                && _.Status == ResultProductStatus.Manufactured,
            cancellationToken: cancellation
        );

        return value >= 0 && value <= manufacturedProductResult!.Amount;
    }

    public override string Name => "IsAcceptedAmountCorrectValidatorForChangeAmount";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Accepted amount is not valid";
}
