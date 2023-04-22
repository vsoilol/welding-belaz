using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountRepository
{
    Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAndWorkplaceAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAndWorkshopAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAndProductionAreaAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    );
}
