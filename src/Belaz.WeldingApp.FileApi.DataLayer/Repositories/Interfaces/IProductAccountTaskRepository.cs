using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountTaskRepository
{
    Task<ProductAccountTaskDto> GetProductAccountTaskById(Guid id);

    Task<List<ProductAccountTaskAmountDto>> GetProductAccountTaskAmountsByProductionAreaAsync(DateTime startDate,
        DateTime endDate,
        Guid productionAreaId);

    Task<List<ProductAccountTaskAmountDto>> GetProductAccountTaskAmountsAsync(DateTime startDate, DateTime endDate);

    Task<List<ProductAccountTaskAmountDto>> GetProductAccountTaskAmountsByWorkplaceAsync(DateTime startDate,
        DateTime endDate, Guid workplaceId);

    Task<List<ProductAccountTaskAmountDto>> GetProductAccountTaskAmountsByWorkshopAsync(DateTime startDate,
        DateTime endDate, Guid workshopId);
}