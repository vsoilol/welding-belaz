using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportByWorkshopRequestValidator
    : AbstractValidator<ExcelEquipmentEfficiencyReportByWorkshopRequest>
{
    public ExcelEquipmentEfficiencyReportByWorkshopRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WorkshopId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<ExcelEquipmentEfficiencyReportByWorkshopRequest, Workshop>(
                    context
                )
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new ExcelEquipmentEfficiencyReportRequestValidator(context));
    }
}
