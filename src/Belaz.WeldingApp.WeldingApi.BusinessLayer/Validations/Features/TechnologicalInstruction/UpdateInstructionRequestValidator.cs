﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldPassageInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.TechnologicalInstruction;

public class UpdateInstructionRequestValidator : AbstractValidator<UpdateInstructionRequest>
{
    public UpdateInstructionRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateInstructionRequest,
                    Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo.TechnologicalInstruction
                >(context)
            );

        RuleFor(model => model.Name).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Number).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(1);

        RuleFor(model => model.WeldPassages).Cascade(CascadeMode.Stop).NotNull().NotEmpty();

        RuleForEach(model => model.WeldPassages)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new UpdateWeldPassageInstructionRequestValidator(context));
    }
}
