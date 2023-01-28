using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;

public class WelderYearValidatorFor : AsyncPropertyValidator<CreateCalendarWithWelderIdRequest,
    CreateCalendarWithWelderIdRequest>
{
    private readonly ApplicationContext _context;

    public WelderYearValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateCalendarWithWelderIdRequest> context,
        CreateCalendarWithWelderIdRequest value,
        CancellationToken cancellation)
    {
        if (value.Year is < 1000 or > 2999)
        {
            return false;
        }

        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value.Year &&
                                                             _.WeldingEquipmentId == value.WelderId,
            cancellation);

        return !isExist;
    }

    public override string Name => "WelderYearValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year is already exist or not valid";
}