using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccount;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccount;

public class WeldingDateValidator :
    AsyncPropertyValidator<ChangeEndWeldingDateRequest, string>
{
    private readonly ApplicationContext _context;

    public WeldingDateValidator(ApplicationContext context)
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

        if (productAccount is null)
        {
            return false;
        }
        
        if (endDate <= productAccount.DateFromPlan)
        {
            return false;
        }
        
        var hasOverlappingTasks = await _context.WeldingTasks
            .AnyAsync(weldingTask => weldingTask.SeamAccount.ProductAccountId != productAccount.Id &&
                                     productAccount.SequenceNumbers.Contains(weldingTask.SequenceNumber) &&
                                     weldingTask.TaskStatus != WeldingTaskStatus.Completed &&
                                     weldingTask.SeamAccount.ProductAccount.ProductId == productAccount.ProductId &&
                                     weldingTask.SeamAccount.ProductAccount.EndDateFromPlan >= productAccount.DateFromPlan &&
                                     endDate >= weldingTask.WeldingDate.Date, 
                cancellationToken);

        return !hasOverlappingTasks;
    }

    public override string Name => "WeldingDateValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "The end date must be valid and not overlap with existing tasks.";
}