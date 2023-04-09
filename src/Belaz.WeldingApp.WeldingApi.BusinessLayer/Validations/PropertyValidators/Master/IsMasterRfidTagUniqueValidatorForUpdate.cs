using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Master;

public class IsMasterRfidTagUniqueValidatorForUpdate
    : AsyncPropertyValidator<UpdateMasterRequest, string>
{
    private readonly ApplicationContext _context;

    public IsMasterRfidTagUniqueValidatorForUpdate(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<UpdateMasterRequest> context,
        string value,
        CancellationToken cancellation
    )
    {
        var userData = await _context.Users
            .Include(_ => _.Masters)
            .FirstOrDefaultAsync(_ => _.RfidTag == value);

        return userData is null || userData.Masters.Any(_ => _.Id == context.InstanceToValidate.Id);
    }

    public override string Name => "IsMasterRfidTagUniqueValidatorForUpdate";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Rfid tag is already exist";
}
