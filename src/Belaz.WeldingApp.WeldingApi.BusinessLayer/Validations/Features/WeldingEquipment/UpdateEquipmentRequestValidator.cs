using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingEquipment;

public class UpdateEquipmentRequestValidator : AbstractValidator<UpdateEquipmentRequest>
{
    public UpdateEquipmentRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateEquipmentRequest,
                    Domain.Entities.WeldingEquipmentInfo.WeldingEquipment
                >(context)
            );

        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .SetAsyncValidator(new IsEquipmentRfidTagUniqueValidatorForUpdate(context))
            .NotEmpty();

        RuleFor(model => model.Name).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Marking).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.FactoryNumber).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.CommissioningDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateEquipmentRequest>());

        RuleFor(model => model.Height)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .When(_ => _.Height is not null);

        RuleFor(model => model.Width)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .When(_ => _.Width is not null);

        RuleFor(model => model.Lenght)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .When(_ => _.Lenght is not null);

        RuleFor(model => model.GroupNumber).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.ManufacturerName).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.NextAttestationDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateEquipmentRequest>());

        RuleFor(model => model.WeldingProcess).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.IdleVoltage)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.IdleVoltage is not null);

        RuleFor(model => model.WeldingCurrentMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.WeldingCurrentMin is not null);

        RuleFor(model => model.WeldingCurrentMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.WeldingCurrentMax is not null);

        RuleFor(model => model.ArcVoltageMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.ArcVoltageMin is not null);

        RuleFor(model => model.ArcVoltageMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.ArcVoltageMax is not null);

        RuleFor(model => model.LoadDuration)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.LoadDuration is not null);

        RuleFor(model => model.PostId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateEquipmentRequest, Domain.Entities.Production.Post>(
                    context
                )
            )
            .When(_ => _.PostId is not null);

        RuleForEach(model => model.WorkplaceIds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<UpdateEquipmentRequest, Domain.Entities.Production.Workplace>(
                    context
                )
            );
    }
}
