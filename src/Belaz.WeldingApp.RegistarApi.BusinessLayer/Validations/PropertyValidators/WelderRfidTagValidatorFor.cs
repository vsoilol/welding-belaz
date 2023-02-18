using Belaz.WeldingApp.RegistarApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;

public class WelderRfidTagValidatorFor<T> : AsyncPropertyValidator<T, string>
{
    private readonly ApplicationContext _context;

    public WelderRfidTagValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, string value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Welders
            .AnyAsync(_ => _.UserInfo.RfidTag == value, cancellationToken: cancellation);

        return isExist;
    }

    public override string Name => "WelderRfidTagValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Welder with such rfid tag is not exist";
}