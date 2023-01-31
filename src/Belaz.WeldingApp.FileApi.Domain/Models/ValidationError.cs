namespace Belaz.WeldingApp.FileApi.Domain.Models;

public class ValidationError
{
    /// <summary>
    /// The name of the property.
    /// </summary>
    public string PropertyName { get; set; }

    /// <summary>
    /// The error message
    /// </summary>
    public string ErrorMessage { get; set; }

    public ValidationError(string propertyName, string errorMessage)
    {
        PropertyName = propertyName;
        ErrorMessage = errorMessage;
    }
}