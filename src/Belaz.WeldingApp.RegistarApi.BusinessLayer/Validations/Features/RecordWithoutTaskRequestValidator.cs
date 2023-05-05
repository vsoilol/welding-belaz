﻿using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using Belaz.WeldingApp.Common.Entities.Users;
using Belaz.WeldingApp.Common.Entities.WeldingEquipmentInfo;
using FluentValidation;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Features;

public class RecordWithoutTaskRequestValidator : AbstractValidator<RecordWithoutTaskRequest>
{
    public RecordWithoutTaskRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RegistarId).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<RecordWithoutTaskRequest, WeldingEquipment>(context)
            );

        RuleFor(model => model.WelderId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<RecordWithoutTaskRequest, Welder>(context));

        RuleFor(model => model.StartDateTime)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleForEach(model => model.Amperages)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0);

        RuleForEach(model => model.Voltages)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0);
        
        RuleFor(model => model.Amperages.Length)
            .Cascade(CascadeMode.Stop)
            .Equal(model => model.Voltages.Length)
            .WithMessage("Amperages must be equal to Voltages");

        RuleFor(model => model.Voltages.Length)
            .Cascade(CascadeMode.Stop)
            .Equal(model => model.Amperages.Length)
            .WithMessage("Voltages must be equal to Amperages");
    }
}