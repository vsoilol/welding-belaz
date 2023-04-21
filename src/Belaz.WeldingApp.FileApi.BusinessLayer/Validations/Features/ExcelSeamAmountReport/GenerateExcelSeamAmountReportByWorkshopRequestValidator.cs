using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelSeamAmountReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelSeamAmountReport;

public class GenerateExcelSeamAmountReportByWorkshopRequestValidator
    : AbstractValidator<GenerateExcelSeamAmountReportByWorkshopRequest>
{
    public GenerateExcelSeamAmountReportByWorkshopRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WorkshopId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelSeamAmountReportByWorkshopRequest, Workshop>(
                    context
                )
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelSeamAmountReportRequestValidator(context));
    }
}
