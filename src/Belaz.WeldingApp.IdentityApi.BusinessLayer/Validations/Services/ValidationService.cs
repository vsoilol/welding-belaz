using Belaz.WeldingApp.IdentityApi.Domain.Exceptions;
using Belaz.WeldingApp.IdentityApi.Domain.Models;
using FluentValidation;
using ValidationException = Belaz.WeldingApp.IdentityApi.Domain.Exceptions.ValidationException;

namespace Belaz.WeldingApp.IdentityApi.BusinessLayer.Validations.Services;

public class ValidationService : IValidationService
{
    private readonly IServiceProvider _serviceProvider;

    public ValidationService(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task<ValidationResult> ValidateAsync<T>(T entity)
    {
        Type genericType = typeof(IValidator<>).MakeGenericType(typeof(T));

        if (_serviceProvider.GetService(genericType) is not IValidator<T> validator)
        {
            throw new NotSuchValidatorException(typeof(T));
        }

        var validationResult = await validator.ValidateAsync(entity);

        if (validationResult.IsValid)
        {
            return new ValidationResult { IsValid = true };
        }

        var errors = validationResult.Errors.Select(
            _ => new ValidationError(_.PropertyName, _.ErrorMessage)
        );

        var validationException = new ValidationException(errors);
        return new ValidationResult { IsValid = false, Exception = validationException };
    }
}
