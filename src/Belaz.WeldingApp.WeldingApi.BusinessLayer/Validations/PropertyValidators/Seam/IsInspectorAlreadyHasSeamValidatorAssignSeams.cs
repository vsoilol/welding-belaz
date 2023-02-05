using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Seam;

public class IsInspectorAlreadyHasSeamValidatorAssignSeams: AsyncPropertyValidator<AssignSeamsToInspectorRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsInspectorAlreadyHasSeamValidatorAssignSeams(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<AssignSeamsToInspectorRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Seams
            .AnyAsync(_ => _.InspectorId == context.InstanceToValidate.InspectorId
                           && _.Id == value, cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsWelderAlreadyHasSeamValidatorAssignSeams";
    
    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This seam is already assign to inspector";
}