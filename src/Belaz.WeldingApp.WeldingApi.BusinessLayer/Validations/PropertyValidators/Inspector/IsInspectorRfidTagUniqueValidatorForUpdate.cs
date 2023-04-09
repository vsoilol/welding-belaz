using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Inspector;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Inspector;

public class IsInspectorRfidTagUniqueValidatorForUpdate
    : AsyncPropertyValidator<UpdateInspectorRequest, string>
{
    private readonly ApplicationContext _context;

    public IsInspectorRfidTagUniqueValidatorForUpdate(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<UpdateInspectorRequest> context,
        string value,
        CancellationToken cancellation
    )
    {
        var userData = await _context.Users
            .Include(_ => _.Inspectors)
            .FirstOrDefaultAsync(_ => _.RfidTag == value);

        return userData is null
            || userData.Inspectors.Any(_ => _.Id == context.InstanceToValidate.Id);
    }

    public override string Name => "IsInspectorRfidTagUniqueValidatorForUpdate";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Rfid tag is already exist";
}
