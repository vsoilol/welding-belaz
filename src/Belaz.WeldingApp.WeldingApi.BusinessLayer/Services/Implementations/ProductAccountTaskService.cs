using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductAccountTaskService : IProductAccountTaskService
{
    private readonly IProductAccountTaskRepository _productAccountTaskRepository;
    
    public ProductAccountTaskService(IProductAccountTaskRepository productAccountTaskRepository)
    {
        _productAccountTaskRepository = productAccountTaskRepository;
    }

    public async Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync()
    {
        var productAccountTasks = await _productAccountTaskRepository.GetAllProductAccountTasksAsync();

        var count = productAccountTasks.Count;

        for (var i = 0; i < count; i++)
        {
            productAccountTasks[i].Number = count - i;
        }

        return productAccountTasks;
    }
}