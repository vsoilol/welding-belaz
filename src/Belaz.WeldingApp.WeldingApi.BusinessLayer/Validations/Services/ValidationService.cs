using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using Belaz.WeldingApp.WeldingApi.Domain.Models;
using FluentValidation;
using ValidationException = Belaz.WeldingApp.WeldingApi.Domain.Exceptions.ValidationException;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;

public class ValidationService : IValidationService
{
    private readonly IServiceProvider _serviceProvider;

    public ValidationService(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task ValidateAsync<T>(T entity)
    {
        Type genericType = typeof(IValidator<>).MakeGenericType(typeof(T));

        if (_serviceProvider.GetService(genericType) is not IValidator<T> validator)
        {
            throw new NotSuchValidatorException(typeof(T));
        }

        var validationResult = await validator.ValidateAsync(entity);

        if (!validationResult.IsValid)
        {
            var errors = validationResult
                .Errors
                .Select(_ => new ValidationError(_.PropertyName, _.ErrorMessage));
            
            throw new ValidationException(errors);
        }
    }
}