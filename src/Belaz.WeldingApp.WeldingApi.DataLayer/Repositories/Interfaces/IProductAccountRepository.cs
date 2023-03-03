using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountRepository
{
    Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId);

    Task<List<ProductAccountDto>> GetAllByDateAsync(DateTime date, Guid productionAreaId);

    Task<ProductAccountDto> ChangeManufacturedAmountAsync(Guid id, int manufacturedAmount);

    Task<ProductAccountDto> ChangAmountFromPlanAsync(Guid id, int amountFromPlan);

    Task<ProductAccountDto> GetByIdAsync(Guid id);

    Task AssignProductAccountToWeldersAsync(Guid productAccountId, List<Guid> welderIds);

    Task GenerateTasksAsync(DateTime date, Guid productionAreaId, Guid userId);
}
