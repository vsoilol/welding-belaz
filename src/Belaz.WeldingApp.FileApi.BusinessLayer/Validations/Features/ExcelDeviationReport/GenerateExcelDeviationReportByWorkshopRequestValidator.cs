using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests.ExcelDeviationReport;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using Belaz.WeldingApp.FileApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Entities.Production;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features.ExcelDeviationReport;

public class GenerateExcelDeviationReportByWorkshopRequestValidator
    : AbstractValidator<GenerateExcelDeviationReportByWorkshopRequest>
{
    public GenerateExcelDeviationReportByWorkshopRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.WorkshopId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateExcelDeviationReportByWorkshopRequest, Workshop>(
                    context
                )
            );

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new GenerateExcelDeviationReportRequestValidator(context));
    }
}
