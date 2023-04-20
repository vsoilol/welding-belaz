using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.Common.Entities;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class IsRfidTagExistValidatorFor<T, TEntity> : AsyncPropertyValidator<T, string>
    where TEntity : EntityWithRfidTag
{
    private readonly ApplicationContext _context;

    public IsRfidTagExistValidatorFor(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<T> context,
        string value,
        CancellationToken cancellation
    )
    {
        var entity = await _context.Set<TEntity>().FirstOrDefaultAsync(_ => _.RfidTag == value);

        return entity is null;
    }

    public override string Name => "IsRfidTagExistValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Rfid tag is already exist";
}
