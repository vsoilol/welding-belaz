using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators;
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
            .SetValidator(new SqlIdValidatorFor<UpdateEquipmentRequest,
                Domain.Entities.WeldingEquipmentInfo.WeldingEquipment>(context));

        RuleFor(model => model.RfidTag)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.Marking)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.FactoryNumber)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.CommissioningDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateEquipmentRequest>());

        RuleFor(model => model.Height)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.Width)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.Lenght)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.GroupNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.ManufacturerName)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.NextAttestationDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<UpdateEquipmentRequest>());

        RuleFor(model => model.WeldingProcess)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.IdleVoltage)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.WeldingCurrentMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.WeldingCurrentMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.ArcVoltageMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.ArcVoltageMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.PostId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(new SqlIdValidatorFor<UpdateEquipmentRequest,
                Domain.Entities.Production.Post>(context))
            .When(_ => _.PostId is not null);
    }
}