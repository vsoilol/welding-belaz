using System.Text.RegularExpressions;
using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class DateValidatorFor<T> : PropertyValidator<T, string>
{
    public override bool IsValid(ValidationContext<T> context, string value)
    {
        if (string.IsNullOrEmpty(value))
        {
            return false;
        }
        
        Regex checkDate = new Regex(@"(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[012])\.(19|20|21)\d\d");
        
        return checkDate.IsMatch(value);
    }

    public override string Name => "DateValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Date is not valid";
}