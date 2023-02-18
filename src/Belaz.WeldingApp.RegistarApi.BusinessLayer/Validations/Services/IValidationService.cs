using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.RegistarApi.BusinessLayer.Validations.Services;

public interface IValidationService
{
    Task<Result<Unit>> ValidateAsync<T>(T entity);
}