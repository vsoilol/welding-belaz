﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Seam;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Seam;

public class AddDefectiveReasonToSeamRequestValidator : AbstractValidator<AddDefectiveReasonToSeamRequest>
{
    public AddDefectiveReasonToSeamRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Reason)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<AddDefectiveReasonToSeamRequest,
                Domain.Entities.ProductInfo.Seam>(context));

        RuleFor(model => model.Date)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<AddDefectiveReasonToSeamRequest>());
    }
}