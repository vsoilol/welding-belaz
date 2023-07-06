using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;

public class EquipmentCalendarAlreadyExistValidatorFor
    : AsyncPropertyValidator<CreateEquipmentCalendarBasedOnMainRequest, CreateEquipmentCalendarBasedOnMainRequest>
{
    private readonly ApplicationContext _context;

    public EquipmentCalendarAlreadyExistValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateEquipmentCalendarBasedOnMainRequest> context,
        CreateEquipmentCalendarBasedOnMainRequest value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value.Year &&
                                                             _.WeldingEquipmentId == value.EquipmentId,
            cancellation);

        return !isExist;
    }

    public override string Name => "EquipmentCalendarAlreadyExistValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year already exist";
}