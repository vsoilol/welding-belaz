using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentEfficiencyReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelEquipmentEfficiencyReport;

public class ExcelEquipmentEfficiencyReportByProductionAreaRequestValidator
    : AbstractValidator<ExcelEquipmentEfficiencyReportByProductionAreaRequest>
{
    public ExcelEquipmentEfficiencyReportByProductionAreaRequestValidator(
        ApplicationContext context
    )
    {
        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    ExcelEquipmentEfficiencyReportByProductionAreaRequest,
                    ProductionArea
                >(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new ExcelEquipmentEfficiencyReportRequestValidator(context));
    }
}
