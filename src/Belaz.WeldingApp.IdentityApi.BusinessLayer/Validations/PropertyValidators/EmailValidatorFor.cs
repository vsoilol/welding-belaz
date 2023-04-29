using System.Text.RegularExpressions;
using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.PropertyValidators;

public class EmailValidatorFor<T> : PropertyValidator<T, string>
{
    public override bool IsValid(ValidationContext<T> context, string value)
    {
        if (string.IsNullOrEmpty(value))
        {
            return false;
        }

        var checkEmail = new Regex("^\\S+@\\S+\\.\\S+$");

        return checkEmail.IsMatch(value);
    }

    public override string Name => "EmailValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Email is not valid";
}
