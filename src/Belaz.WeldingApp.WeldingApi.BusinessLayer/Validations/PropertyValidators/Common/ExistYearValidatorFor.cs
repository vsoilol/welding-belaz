using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class ExistYearValidatorFor<T> : AsyncPropertyValidator<T, int>
{
    private readonly ApplicationContext _context;

    public ExistYearValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, int value, CancellationToken cancellation)
    {
        if (value is < 1000 or > 2999)
        {
            return false;
        }

        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value && _.IsMain, cancellation);

        return !isExist;
    }

    public override string Name => "ExistYearValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year is already exist or not valid";
}