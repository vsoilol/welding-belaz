using Belaz.WeldingApp.FileApi.Domain.Models;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.FileApi.BusinessLayer.Validations.Services;

public interface IValidationService
{
    Task<ValidationResult> ValidateAsync<T>(T entity);
}
