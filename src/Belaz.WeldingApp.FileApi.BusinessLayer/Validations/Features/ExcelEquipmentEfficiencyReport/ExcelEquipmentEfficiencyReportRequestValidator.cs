using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportRequestValidator
    : AbstractValidator<ExcelEquipmentEfficiencyReportRequest>
{
    public ExcelEquipmentEfficiencyReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<ExcelEquipmentEfficiencyReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<ExcelEquipmentEfficiencyReportRequest>());
    }
}
