using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelEquipmentOperationAnalysisReport;

public class ExcelEquipmentOperationAnalysisReportByProductionAreaRequestValidator
    : AbstractValidator<ExcelEquipmentOperationAnalysisReportByProductionAreaRequest>
{
    public ExcelEquipmentOperationAnalysisReportByProductionAreaRequestValidator(
        ApplicationContext context
    )
    {
        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ExcelEquipmentOperationAnalysisReportByProductionAreaRequest,
                    ProductionArea
                >(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new ExcelEquipmentOperationAnalysisReportRequestValidator(context));
    }
}
