using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Welder;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Welder;

public class IsEquipmentAlreadyAssignValidatorForUpdateWelder : AsyncPropertyValidator<UpdateWelderRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsEquipmentAlreadyAssignValidatorForUpdateWelder(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<UpdateWelderRequest> context,
        Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.WeldingEquipments
            .AnyAsync(_ => _.Id == value &&
                           _.WelderId != context.InstanceToValidate.Id &&
                           _.WelderId != null, cancellation);

        return !isExist;
    }

    public override string Name => "IsEquipmentAlreadyAssignValidatorForUpdateWelder";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This equipment already has welder";
}