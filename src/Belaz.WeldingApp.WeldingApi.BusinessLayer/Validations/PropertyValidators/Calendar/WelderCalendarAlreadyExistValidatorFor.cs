using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Calendar;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Calendar;

public class WelderCalendarAlreadyExistValidatorFor :
    AsyncPropertyValidator<CreateWelderCalendarBasedOnMainRequest, CreateWelderCalendarBasedOnMainRequest>
{
    private readonly ApplicationContext _context;

    public WelderCalendarAlreadyExistValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override string Name => "WelderCalendarAlreadyExistValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year already exist";

    public override async Task<bool> IsValidAsync(ValidationContext<CreateWelderCalendarBasedOnMainRequest> context,
        CreateWelderCalendarBasedOnMainRequest value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Calendars.AnyAsync(_ => _.Year == value.Year &&
                                                             _.WelderId == value.WelderId,
            cancellation);

        return !isExist;
    }
}