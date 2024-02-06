using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountTaskRepository
{
    Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync();
}