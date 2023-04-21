using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByProductionAreaRequestValidator
    : AbstractValidator<GenerateExcelWelderOperationReportByProductionAreaRequest>
{
    public GenerateExcelWelderOperationReportByProductionAreaRequestValidator(
        ApplicationContext context
    )
    {
        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateExcelWelderOperationReportByProductionAreaRequest,
                    ProductionArea
                >(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelWelderOperationReportRequestValidator(context));
    }
}
