using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace Belaz.WeldingApp.IdentityApi.WebApi.Attributes
{
    [AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter,
        AllowMultiple = false)]
    public sealed class CustomEmailAddressAttribute : DataTypeAttribute
    {
        private static bool EnableFullDomainLiterals { get; } =
            AppContext.TryGetSwitch("System.Net.AllowFullDomainLiterals", out bool enable) ? enable : false;

        public CustomEmailAddressAttribute() : base(DataType.EmailAddress)
        {
            base.ErrorMessage = "The UserName field is not a valid e-mail address.";
        }

        public override bool IsValid(object? value)
        {
            if (value == null)
            {
                return false;
            }

            if (!(value is string valueAsString))
            {
                return false;
            }

            if (!EnableFullDomainLiterals && (valueAsString.Contains('\r') || valueAsString.Contains('\n')))
            {
                return false;
            }

            if (valueAsString == "admin")
            {
                return true;
            }

            Regex validateEmailRegex = new Regex("^\\S+@\\S+\\.\\S+$");
            var validationResult = validateEmailRegex.IsMatch(valueAsString);

            return validationResult;
        }

    }
}
