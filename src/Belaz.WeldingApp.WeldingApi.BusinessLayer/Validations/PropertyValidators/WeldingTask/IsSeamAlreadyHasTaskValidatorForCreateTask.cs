using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingTask;

public class IsSeamAlreadyHasTaskValidatorForCreateTask : AsyncPropertyValidator<CreateWeldingTaskRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsSeamAlreadyHasTaskValidatorForCreateTask(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<CreateWeldingTaskRequest> context, Guid value, CancellationToken cancellation)
    {
        var isExist = await _context.Seams
            .AnyAsync(_ => _.Id == value
                           && _.WeldingTask != null,
                cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsSeamAlreadyHasTaskValidatorForCreateTask";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This seam already has welding task";
}