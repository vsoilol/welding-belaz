using Belaz.WeldingApp.WeldingApi.Domain.Exceptions;
using Belaz.WeldingApp.WeldingApi.Domain.Models;
using FluentValidation;
using FluentValidation.Results;
using LanguageExt;
using LanguageExt.Common;
using ValidationException = Belaz.WeldingApp.WeldingApi.Domain.Exceptions.ValidationException;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;

public class ValidationService : IValidationService
{
    private readonly IServiceProvider _serviceProvider;

    public ValidationService(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task<Result<Unit>> ValidateAsync<T>(T entity)
    {
        Type genericType = typeof(IValidator<>).MakeGenericType(typeof(T));

        if (_serviceProvider.GetService(genericType) is not IValidator<T> validator)
        {
            throw new NotSuchValidatorException(typeof(T));
        }

        var validationResult = await validator.ValidateAsync(entity);

        if (validationResult.IsValid)
        {
            return Unit.Default;
        }

        var errors = validationResult
            .Errors
            .Select(_ => new ValidationError(_.PropertyName, _.ErrorMessage));

        var validationException = new ValidationException(errors);
        return new Result<Unit>(validationException);
    }
}