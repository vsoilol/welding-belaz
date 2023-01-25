namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;

public interface IValidationService
{
    Task ValidateAsync<T>(T entity);
}