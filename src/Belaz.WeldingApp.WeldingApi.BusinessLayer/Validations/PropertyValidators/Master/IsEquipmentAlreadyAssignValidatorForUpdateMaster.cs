using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Master;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Master;

public class IsEquipmentAlreadyAssignValidatorForUpdateMaster : AsyncPropertyValidator<UpdateMasterRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsEquipmentAlreadyAssignValidatorForUpdateMaster(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<UpdateMasterRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Masters
            .AnyAsync(_ => _.WeldingEquipmentId == value &&
                           _.Id != context.InstanceToValidate.Id, cancellation);

        return !isExist;
    }

    public override string Name => "IsEquipmentAlreadyAssignValidatorForUpdateMaster";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This equipment already has master";
}