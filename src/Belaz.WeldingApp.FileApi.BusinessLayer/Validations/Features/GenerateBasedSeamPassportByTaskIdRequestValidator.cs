using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.FileApi.BusinessLayer.Requests;
using Belaz.WeldingApp.FileApi.BusinessLayer.Validations.PropertyValidators;
using Belaz.WeldingApp.FileApi.DataLayer;
using FluentValidation;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Features;

public class GenerateBasedSeamPassportByTaskIdRequestValidator :
    AbstractValidator<GenerateBasedSeamPassportByTaskIdRequest>
{
    public GenerateBasedSeamPassportByTaskIdRequestValidator(ApplicationContext context)
    {
        RuleFor(model => model.TaskId)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .SetValidator(
                new SqlIdValidatorFor<GenerateBasedSeamPassportByTaskIdRequest, WeldingTask>(context)
            );

        RuleFor(model => model.SequenceNumber)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .NotNull()
            .When(_ => _.SequenceNumber is not null);
        
        RuleFor(model => model.AverageIntervalSeconds)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .GreaterThanOrEqualTo(0.1)
            .LessThanOrEqualTo(60)
            .When(_ => _.AverageIntervalSeconds is not null);
        
        RuleFor(model => model.SecondsToIgnoreBetweenGraphs)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .GreaterThanOrEqualTo(1)
            .LessThanOrEqualTo(180)
            .When(_ => _.SecondsToIgnoreBetweenGraphs is not null);
    }
}