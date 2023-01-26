using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;

public class EquipmentYearValidatorFor : AsyncPropertyValidator<CreateCalendarWithEquipmentIdRequest,
    CreateCalendarWithEquipmentIdRequest>
{
    private readonly ApplicationContext _context;

    public EquipmentYearValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateCalendarWithEquipmentIdRequest> context,
        CreateCalendarWithEquipmentIdRequest value,
        CancellationToken cancellation)
    {
        if (value.Year is < 1000 or > 2999)
        {
            return false;
        }

        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value.Year &&
                                                             _.WeldingEquipmentId == value.WeldingEquipmentId,
            cancellation);

        return !isExist;
    }

    public override string Name => "EquipmentYearValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year is already exist or not valid";
}