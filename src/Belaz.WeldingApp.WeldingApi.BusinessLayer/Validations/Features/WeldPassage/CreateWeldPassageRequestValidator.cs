using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldPassage;
using Belaz.WeldingApp.WeldingApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldPassage;

public class CreateWeldPassageRequestValidator : AbstractValidator<CreateWeldPassageRequest>
{
    public CreateWeldPassageRequestValidator()
    {
        RuleFor(model => model.Name)
            .Cascade(CascadeMode.Stop)
            .NotEmpty();

        RuleFor(model => model.Number)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1);

        RuleFor(model => model.WeldingCurrentMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.WeldingCurrentMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.ArcVoltageMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.ArcVoltageMin is not null);

        RuleFor(model => model.ArcVoltageMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0)
            .When(_ => _.ArcVoltageMax is not null);

        When(_ => _.ArcVoltageMin is null || _.ArcVoltageMax is null,
            () =>
            {
                RuleFor(model => model.ArcVoltageMin)
                    .Cascade(CascadeMode.Stop)
                    .Null();

                RuleFor(model => model.ArcVoltageMax)
                    .Cascade(CascadeMode.Stop)
                    .Null();
            });

        RuleFor(model => model.PreheatingTemperatureMin)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);

        RuleFor(model => model.PreheatingTemperatureMax)
            .Cascade(CascadeMode.Stop)
            .GreaterThan(0);
    }
}