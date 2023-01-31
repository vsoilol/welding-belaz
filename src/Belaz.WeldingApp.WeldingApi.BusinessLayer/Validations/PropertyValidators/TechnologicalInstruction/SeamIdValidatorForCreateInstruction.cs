using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.TechnologicalInstruction;

public class SeamIdValidatorForCreateInstruction : AsyncPropertyValidator<CreateInstructionRequest, Guid>
{
    private readonly ApplicationContext _context;

    public SeamIdValidatorForCreateInstruction(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateInstructionRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Seams
            .AnyAsync(_ => _.Id == value
                           && _.TechnologicalInstruction != null,
                cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "SeamIdValidatorForCreateInstruction";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This seam already has instruction";
}