using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;

public class MainCalendarIsNotExistValidatorFor<T> : AsyncPropertyValidator<T, int>
{
    private readonly ApplicationContext _context;

    public MainCalendarIsNotExistValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override string Name => "MainCalendarIsNotExistValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year is not exist";

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, int value, CancellationToken cancellation)
    {
        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value && _.IsMain,
            cancellation);

        return isExist;
    }
}