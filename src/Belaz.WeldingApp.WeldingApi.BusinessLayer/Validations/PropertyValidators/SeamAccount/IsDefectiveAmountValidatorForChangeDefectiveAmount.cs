using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.SeamAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.SeamAccount;

public class IsDefectiveAmountValidatorForChangeDefectiveAmount
    : AsyncPropertyValidator<ChangeSeamAccountDefectiveAmountRequest, int>
{
    private readonly ApplicationContext _context;

    public IsDefectiveAmountValidatorForChangeDefectiveAmount(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<ChangeSeamAccountDefectiveAmountRequest> context,
        int value,
        CancellationToken cancellation
    )
    {
        var seamAccount = (
            await _context.SeamAccounts
                .Include(_ => _.SeamResults)
                .FirstOrDefaultAsync(_ => _.Id == context.InstanceToValidate.SeamAccountId)
        )!;

        var seamResultDefective = seamAccount.SeamResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Defective
        )!;

        var seamResultAccept = seamAccount.SeamResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Accept
        )!;

        return value <= seamResultAccept.Amount + seamResultDefective.Amount && value >= 0;
    }

    public override string Name => "IsDefectiveAmountValidatorForChangeDefectiveAmount";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Defective amount is not valid";
}
