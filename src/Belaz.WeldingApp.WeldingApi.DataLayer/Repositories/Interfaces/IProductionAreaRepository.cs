using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductioArea;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductionAreaRepository
{
    Task<List<ProductionAreaDto>> GetAllAsync();
}