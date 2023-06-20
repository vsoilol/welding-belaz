using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingRecord;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class GetRecordsByDatePeriodRequestValidator : AbstractValidator<GetRecordsByDatePeriodRequest>
{
    public GetRecordsByDatePeriodRequestValidator()
    {
        RuleFor(model => model.StartDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GetRecordsByDatePeriodRequest>());

        RuleFor(model => model.EndDate)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new DateValidatorFor<GetRecordsByDatePeriodRequest>());
        
        RuleFor(model => model.SeamNumber)
            .Cascade(CascadeMode.Stop)
            .GreaterThanOrEqualTo(1)
            .When(_ => _.SeamNumber is not null);

        RuleFor(model => model)
            .Cascade(CascadeMode.Stop)
            .SetValidator(new IsDatePeriodCorrectValidator());
    }
}