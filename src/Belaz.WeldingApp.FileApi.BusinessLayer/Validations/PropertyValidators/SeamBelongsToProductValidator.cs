using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;
using FluentValidation.Validators;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;

public class SeamBelongsToProductValidator
    : AsyncPropertyValidator<GenerateExcelDeviationReportByWorkshopRequest, Guid>
{
    private readonly ApplicationContext _context;

    public SeamBelongsToProductValidator(ApplicationContext context)
    {
        _context = context;
    }

    public override async Task<bool> IsValidAsync(
        ValidationContext<GenerateExcelDeviationReportByWorkshopRequest> context,
        Guid value,
        CancellationToken cancellation
    )
    {
        var isSeamBelongsToProduct = await _context.Seams.AnyAsync(
            s => s.Id == value && s.ProductId == context.InstanceToValidate.ProductId,
            cancellation
        );

        return isSeamBelongsToProduct;
    }

    public override string Name => nameof(SeamBelongsToProductValidator);

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "This seam does not belong to the product";
}
