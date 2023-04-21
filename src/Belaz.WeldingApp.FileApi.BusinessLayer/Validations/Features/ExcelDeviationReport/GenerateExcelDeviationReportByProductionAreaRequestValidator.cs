using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelDeviationReport;

public class GenerateExcelDeviationReportByProductionAreaRequestValidator
    : AbstractValidator<GenerateExcelDeviationReportByProductionAreaRequest>
{
    public GenerateExcelDeviationReportByProductionAreaRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateExcelDeviationReportByProductionAreaRequest,
                    ProductionArea
                >(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelDeviationReportRequestValidator(context));
    }
}
