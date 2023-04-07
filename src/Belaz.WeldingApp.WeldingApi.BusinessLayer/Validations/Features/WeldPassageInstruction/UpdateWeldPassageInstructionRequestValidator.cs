using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassageInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldPassageInstruction;

public class UpdateWeldPassageInstructionRequestValidator
    : AbstractValidator<UpdateWeldPassageInstructionRequest>
{
    public UpdateWeldPassageInstructionRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.Id)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<
                    UpdateWeldPassageInstructionRequest,
                    Domain.Entities.TechnologicalProcessInfo.WeldPassageInstruction
                >(context)
            )
            .When(_ => _.Id is not null);

        RuleFor(model => model.Name).Cascade(CascadeMode.Stop).NotEmpty();

        RuleFor(model => model.Number).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(1);

        RuleFor(model => model.WeldingCurrentMin).Cascade(CascadeMode.Stop).GreaterThanOrEqualTo(0);

        RuleFor(model => model.WeldingCurrentMax).Cascade(CascadeMode.Stop).GreaterThan(0);

        RuleFor(model => model.ArcVoltageMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0)
            .When(_ => _.ArcVoltageMin is not null);

        RuleFor(model => model.ArcVoltageMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.ArcVoltageMax is not null);

        When(
            _ => _.ArcVoltageMin is null || _.ArcVoltageMax is null,
            () =>
            {
                RuleFor(model => model.ArcVoltageMin).Cascade(CascadeMode.Stop).Null();

                RuleFor(model => model.ArcVoltageMax).Cascade(CascadeMode.Stop).Null();
            }
        );

        When(
            _ => _.PreheatingTemperatureMin is null || _.PreheatingTemperatureMax is null,
            () =>
            {
                RuleFor(model => model.PreheatingTemperatureMin).Cascade(CascadeMode.Stop).Null();

                RuleFor(model => model.PreheatingTemperatureMax).Cascade(CascadeMode.Stop).Null();
            }
        );

        RuleFor(model => model.PreheatingTemperatureMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(0)
            .When(_ => _.PreheatingTemperatureMin is not null);

        RuleFor(model => model.PreheatingTemperatureMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.PreheatingTemperatureMax is not null);
    }
}
