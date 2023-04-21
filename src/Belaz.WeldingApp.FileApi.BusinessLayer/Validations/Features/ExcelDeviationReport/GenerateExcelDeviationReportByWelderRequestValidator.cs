using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Users;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelDeviationReport;

public class GenerateExcelDeviationReportByWelderRequestValidator
    : AbstractValidator<GenerateExcelDeviationReportByWelderRequest>
{
    public GenerateExcelDeviationReportByWelderRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelDeviationReportByWelderRequest, Welder>(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelDeviationReportRequestValidator(context));
    }
}
