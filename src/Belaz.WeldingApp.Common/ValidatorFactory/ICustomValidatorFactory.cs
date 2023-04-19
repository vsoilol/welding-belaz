using FluentValidation;

namespace Belaz.WeldingApp.Common.ValidatorFactory;

public interface ICustomValidatorFactory
{
    IValidator? GetValidatorFor(Type type);
}