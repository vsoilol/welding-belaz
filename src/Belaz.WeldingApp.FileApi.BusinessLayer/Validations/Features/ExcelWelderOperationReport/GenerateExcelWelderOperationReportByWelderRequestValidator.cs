using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.Users;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByWelderRequestValidator
    : AbstractValidator<GenerateExcelWelderOperationReportByWelderRequest>
{
    public GenerateExcelWelderOperationReportByWelderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelWelderOperationReportByWelderRequest, Welder>(
                    context
                )
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelWelderOperationReportRequestValidator(context));
    }
}
