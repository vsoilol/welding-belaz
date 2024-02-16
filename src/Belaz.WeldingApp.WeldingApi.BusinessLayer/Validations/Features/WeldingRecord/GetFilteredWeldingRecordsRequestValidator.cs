using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingRecord;
using FluentValidation;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Features.WeldingRecord;

public class GetFilteredWeldingRecordsRequestValidator : AbstractValidator<GetFilteredWeldingRecordsRequest>
{
    public GetFilteredWeldingRecordsRequestValidator()
    {
        RuleFor(x => x.SortOrder)
            .Cascade(CascadeMode.Stop)
            .NotEmpty()
            .Must(sortOrder => string.Equals(sortOrder, "asc", StringComparison.OrdinalIgnoreCase) ||
                               string.Equals(sortOrder, "desc", StringComparison.OrdinalIgnoreCase))
            .WithMessage("SortOrder must be either 'asc' or 'desc'.");

        When(x => !string.IsNullOrEmpty(x.DateStart),
            () =>
            {
                RuleFor(x => x.DateEnd)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .WithMessage("DateEnd must be set if DateStart is set.");
                
                RuleFor(x => x.DateStart)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new DateValidatorFor<GetFilteredWeldingRecordsRequest>());
            });

        When(x => !string.IsNullOrEmpty(x.DateEnd),
            () =>
            {
                RuleFor(x => x.DateStart)
                    .Cascade(CascadeMode.Stop)
                    .NotNull()
                    .WithMessage("DateStart must be set if DateEnd is set.");
                
                RuleFor(x => x.DateEnd)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new DateValidatorFor<GetFilteredWeldingRecordsRequest>());
            });
        
        When(x => !string.IsNullOrEmpty(x.DateEnd) && !string.IsNullOrEmpty(x.DateStart),
            () =>
            {
                RuleFor(x => x)
                    .Cascade(CascadeMode.Stop)
                    .SetValidator(new IsDatePeriodCorrectValidator());
            });
    }
}