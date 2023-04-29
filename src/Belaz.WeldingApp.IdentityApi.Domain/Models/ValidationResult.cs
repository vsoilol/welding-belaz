using Belaz.WeldingApp.IdentityApi.Domain.Exceptions;

namespace Belaz.WeldingApp.IdentityApi.Domain.Models;

public class ValidationResult
{
    public bool IsValid { get; set; }

    public ValidationException? Exception { get; set; }
}
