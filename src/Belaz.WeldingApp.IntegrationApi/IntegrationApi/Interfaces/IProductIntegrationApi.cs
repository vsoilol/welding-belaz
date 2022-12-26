using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.Product;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IProductIntegrationApi
{
    Task<List<ProductDto>> GetAllByTaskStatusAsync(Status status);

    Task<ProductDto?> GetByIdAsync(Guid id);
}
