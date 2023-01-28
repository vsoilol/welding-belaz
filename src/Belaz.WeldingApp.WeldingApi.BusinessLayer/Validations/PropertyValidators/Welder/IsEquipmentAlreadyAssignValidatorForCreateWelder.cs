using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Welder;

public class
    IsEquipmentAlreadyAssignValidatorForCreateWelder : AsyncPropertyValidator<CreateWelderRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsEquipmentAlreadyAssignValidatorForCreateWelder(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateWelderRequest> context,
        Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.WeldingEquipments
            .AnyAsync(_ => _.Id == value &&
                           _.WelderId != null, cancellation);

        return !isExist;
    }

    public override string Name => "IsEquipmentAlreadyAssignValidatorForCreateWelder";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This equipment already has welder";
}