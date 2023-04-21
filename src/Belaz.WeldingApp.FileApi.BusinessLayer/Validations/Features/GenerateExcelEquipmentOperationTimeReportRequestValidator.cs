using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features;

public class GenerateExcelEquipmentOperationTimeReportRequestValidator
    : AbstractValidator<GenerateExcelEquipmentOperationTimeReportRequest>
{
    public GenerateExcelEquipmentOperationTimeReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateExcelEquipmentOperationTimeReportRequest,
                    WeldingEquipment
                >(context)
            );

        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelEquipmentOperationTimeReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelEquipmentOperationTimeReportRequest>());
    }
}
