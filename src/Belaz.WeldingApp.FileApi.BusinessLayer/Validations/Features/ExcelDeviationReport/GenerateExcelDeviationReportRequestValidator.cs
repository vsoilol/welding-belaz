using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelDeviationReport;

public class GenerateExcelDeviationReportRequestValidator
    : AbstractValidator<GenerateExcelDeviationReportRequest>
{
    public GenerateExcelDeviationReportRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.ProductId)
            .Cascade(CascadeMode.Stop)
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelDeviationReportRequest, Product>(context)
            )
            .When(_ => _.ProductId is not null);

        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetAsyncValidator(
                new SeamBelongsToProductValidator<GenerateExcelDeviationReportRequest>(context)
            )
            .When(_ => _.SeamId is not null);

        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelDeviationReportRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GenerateExcelDeviationReportRequest>());
    }
}
