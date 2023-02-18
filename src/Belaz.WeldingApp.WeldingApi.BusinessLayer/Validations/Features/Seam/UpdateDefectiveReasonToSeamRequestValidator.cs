using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class UpdateDefectiveReasonToSeamRequestValidator : AbstractValidator<UpdateDefectiveReasonToSeamRequest>
{
    public UpdateDefectiveReasonToSeamRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateDefectiveReasonToSeamRequest, DefectiveReason>(context));

        RuleFor(model => model.Reason)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.DetectedDefectiveDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateDefectiveReasonToSeamRequest>());
    }
}