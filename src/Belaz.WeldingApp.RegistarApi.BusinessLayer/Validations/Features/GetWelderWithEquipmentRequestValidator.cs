﻿using Belaz.WeldingApp.RegistarApi.BusinessLayer.Requests;
using Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.RegistarApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Features;

public class GetWelderWithEquipmentRequestValidator : AbstractValidator<GetWelderWithEquipmentRequest>
{
    public GetWelderWithEquipmentRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.RegistarId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
        
        RuleFor(model => model.WelderRfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new WelderRfidTagValidatorFor<GetWelderWithEquipmentRequest>(context));
        
        RuleFor(model => model.EquipmentRfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new EquipmentRfidTagValidatorFor<GetWelderWithEquipmentRequest>(context));
        
        RuleFor(model => model.StartDateTime)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();
    }
}