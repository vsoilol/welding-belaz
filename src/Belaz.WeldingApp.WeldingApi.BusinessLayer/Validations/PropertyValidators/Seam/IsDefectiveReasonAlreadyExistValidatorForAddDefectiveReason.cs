using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Seam;

public class IsDefectiveReasonAlreadyExistValidatorForAddDefectiveReason :
    AsyncPropertyValidator<AddDefectiveReasonToSeamRequest, Guid>
{
    private readonly ApplicationContext _context;

    public IsDefectiveReasonAlreadyExistValidatorForAddDefectiveReason(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(ValidationContext<AddDefectiveReasonToSeamRequest> context, Guid value,
        CancellationToken cancellation)
    {
        var isExist = await _context.DefectiveReasons
            .AnyAsync(_ => _.WeldingTaskId == value, cancellationToken: cancellation);

        return !isExist;
    }


    public override string Name => "IsDefectiveReasonAlreadyExistValidatorForAddDefectiveReason";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Defective reason for this task already exist";
}