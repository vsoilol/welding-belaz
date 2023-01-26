using FluentValidation.Results;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;

public interface IValidationService
{
    Task<Result<Unit>> ValidateAsync<T>(T entity);
}