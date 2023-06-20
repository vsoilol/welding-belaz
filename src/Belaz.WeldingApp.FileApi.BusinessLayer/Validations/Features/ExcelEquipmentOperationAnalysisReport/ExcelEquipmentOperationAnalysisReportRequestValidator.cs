using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelEquipmentOperationAnalysisReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Enums;
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

        RuleFor(model => model.CutType)
            .Cascade(CascadeMode.Stop)
            .IsInEnum();

        When(
            _ => _.WorkingShiftNumber is not null,
            () =>
            {
                RuleFor(model => model.CutType)
                    .Cascade(CascadeMode.Stop)
                    .Equal(CutType.WorkingShift);
                
                RuleFor(model => model.WorkingShiftNumber)
                    .Cascade(CascadeMode.Stop)
                    .GreaterThanOrEqualTo(1)
                    .LessThanOrEqualTo(3);
            }
        );

        When(
            _ => _.CutType != CutType.WorkingShift,
            () =>
            {
                RuleFor(model => model.WorkingShiftNumber)
                    .Cascade(CascadeMode.Stop)
                    .Null();
            }
        );
    }
}