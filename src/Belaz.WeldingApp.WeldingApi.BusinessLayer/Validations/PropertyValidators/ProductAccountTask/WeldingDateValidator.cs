using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccountTask;

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

        var productAccountTaskId = validationContext.InstanceToValidate.ProductAccountTaskId;
        var productAccountTask = await _context.ProductAccountTasks
            .Include(_ => _.ProductAccount)
            .FirstOrDefaultAsync(pa => pa.Id == productAccountTaskId, cancellationToken);

        if (productAccountTask is null)
        {
            return false;
        }

        if (endDate <= productAccountTask.DateFromPlan)
        {
            return false;
        }

        var hasOverlappingTasks = await _context.ProductAccountTasks
            .AnyAsync(_ => _.ProductAccountId != productAccountTask.ProductAccountId &&
                           _.SequenceNumber == productAccountTask.SequenceNumber &&
                           _.ProductAccount.ProductId == productAccountTask.ProductAccount.ProductId &&
                           _.ProductAccount.EndDateFromPlan >= productAccountTask.DateFromPlan &&
                           endDate >= _.DateFromPlan.Date,
                cancellationToken);

        return !hasOverlappingTasks;
    }

    public override string Name => "WeldingDateValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "The end date must be valid and not overlap with existing tasks.";
}