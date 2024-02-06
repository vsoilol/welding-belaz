using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductAccountTaskService
{
    Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync();
}