using FluentValidation;
using FluentValidation.Validators;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.PropertyValidators.Common;

public class YearValidatorFor<T> : PropertyValidator<T, int>
{
    public override bool IsValid(ValidationContext<T> context, int value)
    {
        return value is >= 1000 and <= 2999;
    }

    public override string Name => "YearValidatorFor";

    protected override string GetDefaultMessageTemplate(string errorCode)
        => "Year is not valid";
}