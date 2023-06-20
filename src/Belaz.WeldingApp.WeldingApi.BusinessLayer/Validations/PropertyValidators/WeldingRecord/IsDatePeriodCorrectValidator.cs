using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingRecord;

public class IsDatePeriodCorrectValidator :
    PropertyValidator<GetRecordsByDatePeriodRequest, GetRecordsByDatePeriodRequest>
{
    public override bool IsValid(ValidationContext<GetRecordsByDatePeriodRequest> context,
        GetRecordsByDatePeriodRequest value)
    {
        var startDate = value.StartDate.ToDateTime();
        var endDate = value.EndDate.ToDateTime();

        return endDate >= startDate;
    }

    public override string Name => "IsDatePeriodCorrectValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Period date is not valid";
}