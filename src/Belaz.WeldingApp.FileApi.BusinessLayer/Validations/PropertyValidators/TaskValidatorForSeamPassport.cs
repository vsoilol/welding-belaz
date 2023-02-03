using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;

public class TaskValidatorForSeamPassport : AsyncPropertyValidator<GenerateSeamPassportByTaskIdRequest, Guid>
{
    private readonly ApplicationContext _context;

    public TaskValidatorForSeamPassport(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<GenerateSeamPassportByTaskIdRequest> context,
        Guid value, CancellationToken cancellation)
    {
        var isExist = await _context.Seams
            .AnyAsync(_ => _.WeldingTask!.Id == value && _.Status != ProductStatus.NotManufactured,
                cancellationToken: cancellation);
        return isExist;
    }

    public override string Name => "TaskValidatorForSeamPassport";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Seam Task is not ready";
}