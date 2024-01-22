using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class DefectiveAmountValidator
    : AsyncPropertyValidator<ChangeDefectiveAmountRequest, int>
{
    private readonly ApplicationContext _context;

    public DefectiveAmountValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<ChangeDefectiveAmountRequest> validationContext,
        int defectiveAmount,
        CancellationToken cancellationToken
    )
    {
        var productResult = await _context.ProductResults
            .FirstOrDefaultAsync(
                pr => pr.ProductAccountId == validationContext.InstanceToValidate.ProductAccountId
                      && pr.Status == ResultProductStatus.Manufactured,
                cancellationToken
            );

        return defectiveAmount >= 0 && defectiveAmount <= productResult!.Amount;
    }

    public override string Name => "DefectiveAmountValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Defective amount is not valid";
}