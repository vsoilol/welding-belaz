using Belaz.WeldingApp.FileApi.Domain.Dtos;
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

    Task UpdateAmountFromPlanAsync(Guid id, int amountFromPlan);
    
    Task<ProductAccountAmountFromPlanDto?> GetByProductIdAndDateAsync(Guid productId, DateTime date);
    
    Task AddOnlyByProductAndAmountFromPlanAsync(Guid productId, DateTime date, int amountFromPlan);
    
    Task<List<ProductAccountDto>> GetAllProductAccountsAsync();
}
