using FluentValidation;

namespace WeldingApp.Common.ValidatorFactory;

public interface ICustomValidatorFactory
{
    IValidator? GetValidatorFor(Type type);
}