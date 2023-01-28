using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Chief;

public class IsEquipmentAlreadyAssignValidatorForCreateChief : AsyncPropertyValidator<CreateChiefRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsEquipmentAlreadyAssignValidatorForCreateChief(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateChiefRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Chiefs
            .AnyAsync(_ => _.WeldingEquipmentId == value, cancellation);

        return !isExist;
    }

    public override string Name => "IsEquipmentAlreadyAssignValidatorForCreateChief";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This equipment already has chief";
}