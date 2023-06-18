using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class UpdateWeldingRecordLimitRequestValidator : AbstractValidator<UpdateWeldingRecordLimitRequest>
{
    public UpdateWeldingRecordLimitRequestValidator()
    {
        When(
            _ => _.ArcVoltageMin is not null || _.ArcVoltageMax is not null,
            () =>
            {
                RuleFor(model => model.ArcVoltageMin)
                    .Cascade(CascadeMode.Stop)
                    .GreaterThanOrEqualTo(0)
                    .NotNull();

                RuleFor(model => model.ArcVoltageMax)
                    .Cascade(CascadeMode.Stop)
                    .GreaterThanOrEqualTo(_ => _.ArcVoltageMin)
                    .NotNull();
            }
        );
        
        When(
            _ => _.WeldingCurrentMin is not null || _.WeldingCurrentMax is not null,
            () =>
            {
                RuleFor(model => model.WeldingCurrentMin)
                    .Cascade(CascadeMode.Stop)
                    .GreaterThanOrEqualTo(0)
                    .NotNull();

                RuleFor(model => model.WeldingCurrentMax)
                    .Cascade(CascadeMode.Stop)
                    .GreaterThanOrEqualTo(_ => _.WeldingCurrentMin)
                    .NotNull();
            }
        );
    }
}