using FluentValidation;
using Microsoft.Extensions.DependencyInjection;

namespace WeldingApp.Common.ValidatorFactory;

public class CustomValidatorFactory : ICustomValidatorFactory
{
    private readonly IServiceProvider _serviceProvider;

    public CustomValidatorFactory(IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public IValidator? GetValidatorFor(Type type)
    {
        var genericValidatorType = typeof(IValidator<>);
        var specificValidatorType = genericValidatorType.MakeGenericType(type);
        using (var scope = _serviceProvider.CreateScope())
        {
            var validatorInstance = (IValidator)scope.ServiceProvider.GetService(specificValidatorType);
            return validatorInstance;
        }
    }
}