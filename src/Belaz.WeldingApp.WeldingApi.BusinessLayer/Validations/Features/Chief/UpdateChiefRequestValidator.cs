﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Chief;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.Chief;

public class UpdateChiefRequestValidator : AbstractValidator<UpdateChiefRequest>
{
    public UpdateChiefRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateChiefRequest,
                Domain.Entities.Users.Chief>(context));

        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.FirstName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.LastName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.MiddleName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.ProductionAreaId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateChiefRequest,
                Domain.Entities.Production.ProductionArea>(context));

        RuleFor(model => model.WeldingEquipmentId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateChiefRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context))
            .SetAsyncValidator(new IsEquipmentAlreadyAssignValidatorForUpdateChief(context))
            .When(_ => _.WeldingEquipmentId is not null);
    }
}