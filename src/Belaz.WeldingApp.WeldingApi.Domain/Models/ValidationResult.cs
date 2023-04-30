using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;

namespace Belaz.WeldingApp.WeldingApi.Domain.Models;

public class ValidationResult
{
    public bool IsValid { get; set; }

    public ValidationException? Exception { get; set; }
}