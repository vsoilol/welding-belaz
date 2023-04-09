using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Welder;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Welder;

public class IsWelderRfidTagUniqueValidatorForUpdate
    : AsyncPropertyValidator<UpdateWelderRequest, string>
{
    private readonly ApplicationContext _context;

    public IsWelderRfidTagUniqueValidatorForUpdate(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<UpdateWelderRequest> context,
        string value,
        CancellationToken cancellation
    )
    {
        var userData = await _context.Users
            .Include(_ => _.Welders)
            .FirstOrDefaultAsync(_ => _.RfidTag == value);

        return userData is null || userData.Welders.Any(_ => _.Id == context.InstanceToValidate.Id);
    }

    public override string Name => "IsRfidTagUniqueValidatorForUpdate";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Rfid tag is already exist";
}
