﻿using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingTask;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingTask;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingTask;

public class CreateWeldingTaskRequestValidator : AbstractValidator<CreateWeldingTaskRequest>
{
    public CreateWeldingTaskRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.WeldingDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<CreateWeldingTaskRequest>());

        RuleFor(model => model.BasicMaterial)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.MainMaterialBatchNumber)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.WeldingMaterial)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.WeldingMaterialBatchNumber)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.ProtectiveGas)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .When(_ => _.ProtectiveGas is not null);

        RuleFor(model => model.ProtectiveGasBatchNumber)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .When(_ => _.ProtectiveGasBatchNumber is not null);

        RuleFor(model => model.SeamId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<CreateWeldingTaskRequest, Domain.Entities.ProductInfo.Seam>(context))
            .SetAsyncValidator(new IsSeamAlreadyHasTaskValidatorForCreateTask(context));
    }
}