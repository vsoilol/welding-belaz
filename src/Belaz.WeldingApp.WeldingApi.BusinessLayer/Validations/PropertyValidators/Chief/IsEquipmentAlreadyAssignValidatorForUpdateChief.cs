using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Chief;

public class IsEquipmentAlreadyAssignValidatorForUpdateChief : AsyncPropertyValidator<UpdateChiefRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsEquipmentAlreadyAssignValidatorForUpdateChief(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<UpdateChiefRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Chiefs
            .AnyAsync(_ => _.WeldingEquipmentId == value &&
                           _.Id != context.InstanceToValidate.Id, cancellation);

        return !isExist;
    }

    public override string Name => "IsEquipmentAlreadyAssignValidatorForUpdateChief";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This equipment already has chief";
}