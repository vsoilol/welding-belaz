using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportRequestValidator
    : AbstractValidator<GenerateExcelWelderOperationReportRequest>
{
    public GenerateExcelWelderOperationReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelWelderOperationReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelWelderOperationReportRequest>());
    }
}
