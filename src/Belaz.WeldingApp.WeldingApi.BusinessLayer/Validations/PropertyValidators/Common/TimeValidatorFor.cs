using System.Text.RegularExpressions;
using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class TimeValidatorFor<T> : PropertyValidator<T, string>
{
    public override bool IsValid(ValidationContext<T> context, string value)
    {
        if (string.IsNullOrEmpty(value))
        {
            return false;
        }
        
        Regex checktime = new Regex(@"^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$");
        
        return checktime.IsMatch(value);
    }

    public override string Name => "TimeValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Time is not valid";
}