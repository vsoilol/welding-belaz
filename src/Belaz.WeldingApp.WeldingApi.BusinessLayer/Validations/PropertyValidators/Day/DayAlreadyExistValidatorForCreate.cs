using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Day;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Day;

public class DayAlreadyExistValidatorForCreate : AsyncPropertyValidator<CreateDayWithYearRequest,
    CreateDayWithYearRequest>
{
    private readonly ApplicationContext _context;

    public DayAlreadyExistValidatorForCreate(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateDayWithYearRequest> context,
        CreateDayWithYearRequest value, CancellationToken cancellation)
    {
        var isExist = await _context.Days
            .AnyAsync(_ => _.Calendar.WelderId == value.WelderId
                           && _.Calendar.WeldingEquipmentId == value.WeldingEquipmentId
                           && _.MonthNumber == value.MonthNumber
                           && _.Number == value.Number
                           && _.Calendar.Year == value.Year,
                cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "DayAlreadyExistValidatorForCreate";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Day already exist";
}