using Belaz.WeldingApp.RegistarApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;

public class EquipmentRfidTagValidatorFor<T> : AsyncPropertyValidator<T, string>
{
    private readonly ApplicationContext _context;

    public EquipmentRfidTagValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<T> context, string value, CancellationToken cancellation)
    {
        var isExist = await _context.WeldingEquipments
            .AnyAsync(_ => _.RfidTag == value, cancellationToken: cancellation);

        return isExist;
    }

    public override string Name => "EquipmentRfidTagValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Equipment with such rfid tag is not exist";
}