using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingTask;

public class IsSeamAlreadyHasTaskValidatorForUpdateTask : AsyncPropertyValidator<UpdateWeldingTaskRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsSeamAlreadyHasTaskValidatorForUpdateTask(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<UpdateWeldingTaskRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.Seams
            .AnyAsync(_ => _.Id == value
                           && _.WeldingTask != null
                           && _.WeldingTask.Id != context.InstanceToValidate.Id,
                cancellationToken: cancellation);

        return !isExist;
    }

    public override string Name => "IsSeamAlreadyHasTaskValidatorForUpdateTask";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "This seam already has welding task";
}