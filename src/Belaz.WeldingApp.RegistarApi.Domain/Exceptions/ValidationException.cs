using Belaz.WeldingApp.RegistarApi.Domain.Models;

namespace Belaz.WeldingApp.RegistarApi.Domain.Exceptions;

public class ValidationException : Exception
{
    public ValidationException(IEnumerable<ValidationError> errors) : base(BuildErrorMessage(errors))
    {
        Errors = errors;
    }

    private static string BuildErrorMessage(IEnumerable<ValidationError> errors)
    {
        var arr = errors.Select(x => $"{Environment.NewLine} -- {x.PropertyName}: {x.ErrorMessage}");
        return "Validation failed: " + string.Join(string.Empty, arr);
    }

    public IEnumerable<ValidationError> Errors { get; private set; }
}