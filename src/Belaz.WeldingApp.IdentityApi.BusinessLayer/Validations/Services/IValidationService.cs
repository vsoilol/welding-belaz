using Belaz.WeldingApp.IdentityApi.Domain.Models;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Services;

public interface IValidationService
{
    Task<ValidationResult> ValidateAsync<T>(T entity);
}
