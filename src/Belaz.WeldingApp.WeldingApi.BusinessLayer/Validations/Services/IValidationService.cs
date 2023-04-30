using FluentValidation.Results;
using LanguageExt;
using LanguageExt.Common;
using ValidationResult = Belaz.WeldingApp.WeldingApi.Domain.Models.ValidationResult;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;

public interface IValidationService
{
    Task<ValidationResult> ValidateAsync<T>(T entity);
}