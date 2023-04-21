using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelDeviationReport;

public class GenerateExcelDeviationReportByWorkplaceRequestValidator
    : AbstractValidator<GenerateExcelDeviationReportByWorkplaceRequest>
{
    public GenerateExcelDeviationReportByWorkplaceRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WorkplaceId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelDeviationReportByWorkplaceRequest, Workplace>(
                    context
                )
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelDeviationReportRequestValidator(context));
    }
}
