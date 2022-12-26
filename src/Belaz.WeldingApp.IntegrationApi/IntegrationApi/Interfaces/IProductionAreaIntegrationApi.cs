using Belaz.WeldingApp.IntegrationApi.Contracts.Responses.ProductionArea;

namespace Belaz.WeldingApp.IntegrationApi.IntegrationApi.Interfaces;

public interface IProductionAreaIntegrationApi
{
    Task<List<ProductionAreaDto>> GetAllAsync();

    Task<ProductionAreaDto?> GetByIdAsync(Guid id);
}
