using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountRepository
{
    Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId);

    Task<List<ProductAccountDto>> GetAllByDateAsync(DateTime date, Guid productionAreaId);

    Task<ProductAccountDto> ChangeManufacturedAmountAsync(Guid id, int manufacturedAmount);

    Task<ProductAccountDto> ChangAmountFromPlanAsync(Guid id, int amountFromPlan);

    Task<ProductAccountDto> GetByIdAsync(Guid id);

    Task AssignProductAccountToWeldingEquipmentsAsync(
        Guid productAccountId,
        List<Guid> weldingEquipmentIds
    );

    Task GenerateTasksAsync(DateTime date, Guid productionAreaId, Guid userId);

    Task<List<ProductAccountDto>> ChangeOrderAsync(Guid idFirst, Guid idSecond);

    Task<List<ProductAccountDto>> GenerateByDateAsync(
        DateTime date,
        DateTime newDate,
        Guid productionAreaId
    );
}
