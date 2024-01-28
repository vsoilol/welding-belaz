using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WorkingShift;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WorkingShift;

public class WorkingShiftUniquenessUpdateValidator : AsyncPropertyValidator<UpdateWorkingShiftRequest, int>
{
    private readonly ApplicationContext _dbContext;

    public WorkingShiftUniquenessUpdateValidator(ApplicationContext dbContext)
    {
        _dbContext = dbContext;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<UpdateWorkingShiftRequest> validationContext,
        int shiftNumber, CancellationToken cancellationToken)
    {
        var request = validationContext.InstanceToValidate;

        var currentShift = await _dbContext.WorkingShifts
            .Select(_ => new
            {
                _.DayId,
                _.Id,
                _.CalendarId
            })
            .FirstOrDefaultAsync(ws => ws.Id == request.Id, cancellationToken);

        if (currentShift is null)
        {
            return false;
        }

        return currentShift.DayId.HasValue
            ? await IsShiftNumberUniqueForDayAsync(currentShift.DayId.Value, shiftNumber, request.Id,
                cancellationToken)
            : await IsShiftNumberUniqueForCalendarAsync(currentShift.CalendarId, shiftNumber, request.Id,
                cancellationToken);
    }

    private async Task<bool> IsShiftNumberUniqueForDayAsync(Guid dayId, int shiftNumber, Guid workingShiftId,
        CancellationToken cancellationToken)
    {
        return !await _dbContext.WorkingShifts
            .AnyAsync(ws => ws.DayId == dayId && ws.Number == shiftNumber && ws.Id != workingShiftId,
                cancellationToken);
    }

    private async Task<bool> IsShiftNumberUniqueForCalendarAsync(Guid? calendarId, int shiftNumber, Guid workingShiftId,
        CancellationToken cancellationToken)
    {
        if (calendarId is null)
        {
            return true;
        }

        return !await _dbContext.WorkingShifts
            .AnyAsync(ws => ws.CalendarId == calendarId
                            && ws.Number == shiftNumber
                            && ws.Id != workingShiftId,
                cancellationToken);
    }

    public override string Name => "WorkingShiftUniquenessUpdateValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "A working shift with this number already exists for the specified day or calendar.";
}