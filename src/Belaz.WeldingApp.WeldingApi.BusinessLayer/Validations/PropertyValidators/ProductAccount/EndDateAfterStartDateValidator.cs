using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class EndDateAfterStartDateValidator :
    AsyncPropertyValidator<ChangeEndWeldingDateRequest, string>
{
    private readonly ApplicationContext _context;

    public EndDateAfterStartDateValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<ChangeEndWeldingDateRequest> validationContext,
        string endDateText,
        CancellationToken cancellationToken
    )
    {
        var endDate = endDateText.ToDateTime();

        var productAccountId = validationContext.InstanceToValidate.ProductAccountId;
        var productAccount = await _context.ProductAccounts
            .FirstOrDefaultAsync(pa => pa.Id == productAccountId, cancellationToken);

        return endDate > productAccount!.DateFromPlan;
    }

    public override string Name => "EndDateAfterStartDateValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "The end date must be greater than the start date.";
}