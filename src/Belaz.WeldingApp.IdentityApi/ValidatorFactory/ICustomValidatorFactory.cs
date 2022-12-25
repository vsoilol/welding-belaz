using FluentValidation;

namespace Belaz.WeldingApp.IdentityApi.ValidatorFactory
{
    public interface ICustomValidatorFactory
    {
        IValidator? GetValidatorFor(Type type);
    }
}
