using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.Users;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByWelderRequestValidator
    : AbstractValidator<GenerateExcelSeamAmountReportByWelderRequest>
{
    public GenerateExcelSeamAmountReportByWelderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelSeamAmountReportByWelderRequest, Welder>(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelSeamAmountReportRequestValidator(context));
    }
}
