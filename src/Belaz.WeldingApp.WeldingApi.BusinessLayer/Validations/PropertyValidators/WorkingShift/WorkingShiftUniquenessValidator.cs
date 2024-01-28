using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WorkingShift;

public class WorkingShiftUniquenessValidator
    : AsyncPropertyValidator<CreateWorkingShiftWithYearRequest, int>
{
    private readonly ApplicationContext _dbContext;

    public WorkingShiftUniquenessValidator(ApplicationContext dbContext)
    {
        _dbContext = dbContext;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<CreateWorkingShiftWithYearRequest> validationContext,
        int shiftNumber, CancellationToken cancellationToken)
    {
        var request = validationContext.InstanceToValidate;

        return request.DayId.HasValue
            ? await IsUniqueShiftForDayAsync(request.DayId.Value, shiftNumber, cancellationToken)
            : await IsUniqueShiftForYearAsync(request.CalendarId, shiftNumber, cancellationToken);
    }

    private async Task<bool> IsUniqueShiftForDayAsync(Guid dayId, int shiftNumber, CancellationToken cancellationToken)
    {
        var exists = await _dbContext.WorkingShifts
            .AnyAsync(ws => ws.DayId == dayId && ws.Number == shiftNumber, cancellationToken);
        return !exists;
    }

    private async Task<bool> IsUniqueShiftForYearAsync(Guid? calendarId, int shiftNumber, CancellationToken cancellationToken)
    {
        if (calendarId is null)
        {
            return false;
        }

        var exists = await _dbContext.WorkingShifts
            .AnyAsync(ws => ws.CalendarId == calendarId && ws.Number == shiftNumber, cancellationToken);
        return !exists;
    }

    public override string Name => "WorkingShiftUniquenessValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "A working shift with the same number already exists for the specified day or year.";
}