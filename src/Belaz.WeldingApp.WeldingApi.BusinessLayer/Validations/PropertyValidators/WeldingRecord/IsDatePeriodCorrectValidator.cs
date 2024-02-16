using System.Text.RegularExpressions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.WeldingRecord;

public class IsDatePeriodCorrectValidator :
    PropertyValidator<GetFilteredWeldingRecordsRequest, GetFilteredWeldingRecordsRequest>
{
    public override bool IsValid(ValidationContext<GetFilteredWeldingRecordsRequest> context,
        GetFilteredWeldingRecordsRequest value)
    {
        if (string.IsNullOrEmpty(value.DateStart) || string.IsNullOrEmpty(value.DateEnd))
        {
            return false;
        }
        
        Regex checkDate = new Regex(@"(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[012])\.(19|20|21)\d\d");

        if (!checkDate.IsMatch(value.DateStart) || !checkDate.IsMatch(value.DateEnd))
        {
            return false;
        }
        
        var startDate = value.DateStart.ToDateTime();
        var endDate = value.DateEnd.ToDateTime();

        return endDate >= startDate;
    }

    public override string Name => "IsDatePeriodCorrectValidator";

    protected override string GetDefaultMessageTemplate(string errorCode) =>
        "Period date is not valid";
}