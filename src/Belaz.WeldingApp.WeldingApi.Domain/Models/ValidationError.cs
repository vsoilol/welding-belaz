namespace Belaz.WeldingApp.WeldingApi.Domain.Models;

public class ValidationError
{
    /// <summary>
    /// The name of the property.
    /// </summary>
    public string PropertyName { get; set; } = null!;

    /// <summary>
    /// The error message
    /// </summary>
    public string ErrorMessage { get; set; } = null!;

    public ValidationError(string propertyName, string errorMessage)
    {
        PropertyName = propertyName;
        ErrorMessage = errorMessage;
    }
}