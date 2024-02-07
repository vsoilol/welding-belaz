using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IProductAccountTaskRepository
{
    Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync();

    Task AssignProductAccountTaskToWeldingEquipmentsAsync(
        Guid productAccountTaskId,
        List<Guid> weldingEquipmentIds
    );

    Task<ProductAccountTaskDto> ChangeEndWeldingDateAsync(
        Guid productAccountTaskId,
        DateTime? weldingEndDate
    );

    Task<ProductAccountTaskDto> ChangeDefectiveAmountAsync(
        Guid productAccountTaskId,
        Guid inspectorId,
        int defectiveAmount,
        string? defectiveReason
    );

    Task<ProductAccountTaskDto> ChangeManufacturedAmountAsync(Guid id, int manufacturedAmount);

    Task<ProductAccountTaskDto> UpdateWeldingMaterialInfoAsync(Guid id, string? weldingMaterial,
        string? weldingMaterialBatchNumber);
}