using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelEquipmentOperationAnalysisReport;

public class ExcelEquipmentOperationAnalysisReportRequestValidator
    : AbstractValidator<ExcelEquipmentOperationAnalysisReportRequest>
{
    public ExcelEquipmentOperationAnalysisReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<ExcelEquipmentOperationAnalysisReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<ExcelEquipmentOperationAnalysisReportRequest>());

        RuleFor(model => model.CutType).Cascade(CascadeMode.Stop).IsInEnum();
    }
}
