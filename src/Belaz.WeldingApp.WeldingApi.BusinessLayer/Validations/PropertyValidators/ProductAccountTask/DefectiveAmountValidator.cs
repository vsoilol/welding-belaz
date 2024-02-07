using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductAccountTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.ProductAccountTask;

public class DefectiveAmountValidator
    : AsyncPropertyValidator<ChangeDefectiveAmountRequest, int>
{
    private readonly ApplicationContext _context;

    public DefectiveAmountValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<ChangeDefectiveAmountRequest> validationContext,
        int defectiveAmount,
        CancellationToken cancellationToken
    )
    {
        var productAccountTask = await _context.ProductAccountTasks.FirstOrDefaultAsync(_ =>
            _.Id == validationContext.InstanceToValidate.ProductAccountTaskId, cancellationToken);

        return defectiveAmount >= 0 && defectiveAmount <= productAccountTask!.ManufacturedAmount;
    }

    public override string Name => "DefectiveAmountValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Defective amount is not valid";
}