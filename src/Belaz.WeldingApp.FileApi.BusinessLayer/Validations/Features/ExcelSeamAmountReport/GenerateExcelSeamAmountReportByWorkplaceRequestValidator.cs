using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByWorkplaceRequestValidator
    : AbstractValidator<GenerateExcelSeamAmountReportByWorkplaceRequest>
{
    public GenerateExcelSeamAmountReportByWorkplaceRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WorkplaceId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelSeamAmountReportByWorkplaceRequest, Workplace>(
                    context
                )
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelSeamAmountReportRequestValidator(context));
    }
}
