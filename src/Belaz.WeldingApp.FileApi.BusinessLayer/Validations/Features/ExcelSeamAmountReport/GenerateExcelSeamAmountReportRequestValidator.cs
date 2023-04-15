using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportRequestValidator
    : AbstractValidator<GenerateExcelSeamAmountReportRequest>
{
    public GenerateExcelSeamAmountReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelSeamAmountReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelSeamAmountReportRequest>());
    }
}
