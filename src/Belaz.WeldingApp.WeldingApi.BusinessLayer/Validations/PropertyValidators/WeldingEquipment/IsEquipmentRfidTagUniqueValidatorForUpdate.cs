using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingEquipment;

public class IsEquipmentRfidTagUniqueValidatorForUpdate
    : AsyncPropertyValidator<UpdateEquipmentRequest, string>
{
    private readonly ApplicationContext _context;

    public IsEquipmentRfidTagUniqueValidatorForUpdate(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<UpdateEquipmentRequest> context,
        string value,
        CancellationToken cancellation
    )
    {
        var weldingEquipment = await _context.WeldingEquipments.FirstOrDefaultAsync(
            _ => _.RfidTag == value
        );

        return weldingEquipment is null || weldingEquipment.Id == context.InstanceToValidate.Id;
    }

    public override string Name => "IsEquipmentRfidTagUniqueValidatorForUpdate";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Rfid tag is already exist";
}
