using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class UpdateDefectiveReasonToSeamRequestValidator : AbstractValidator<UpdateDefectiveReasonToSeamRequest>
{
    public UpdateDefectiveReasonToSeamRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateDefectiveReasonToSeamRequest, StatusReason>(context));

        RuleFor(model => model.Reason)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateDefectiveReasonToSeamRequest,
                Domain.Entities.ProductInfo.Seam>(context));

        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateDefectiveReasonToSeamRequest>());
    }
}