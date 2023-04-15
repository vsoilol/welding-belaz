using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features;

public class GenerateExcelEquipmentDowntimeReportRequestValidator
    : AbstractValidator<GenerateExcelEquipmentDowntimeReportRequest>
{
    public GenerateExcelEquipmentDowntimeReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateExcelEquipmentDowntimeReportRequest,
                    WeldingEquipment
                >(context)
            );

        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelEquipmentDowntimeReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelEquipmentDowntimeReportRequest>());
    }
}
