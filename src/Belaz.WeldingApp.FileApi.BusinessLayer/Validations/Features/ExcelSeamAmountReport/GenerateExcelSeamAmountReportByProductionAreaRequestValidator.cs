using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByProductionAreaRequestValidator
    : AbstractValidator<GenerateExcelSeamAmountReportByProductionAreaRequest>
{
    public GenerateExcelSeamAmountReportByProductionAreaRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateExcelSeamAmountReportByProductionAreaRequest,
                    ProductionArea
                >(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelSeamAmountReportRequestValidator(context));
    }
}
