using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelWelderOperationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelWelderOperationReport;

public class GenerateExcelWelderOperationReportByWorkplaceRequestValidator
    : AbstractValidator<GenerateExcelWelderOperationReportByWorkplaceRequest>
{
    public GenerateExcelWelderOperationReportByWorkplaceRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WorkplaceId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    GenerateExcelWelderOperationReportByWorkplaceRequest,
                    Workplace
                >(context)
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelWelderOperationReportRequestValidator(context));
    }
}
