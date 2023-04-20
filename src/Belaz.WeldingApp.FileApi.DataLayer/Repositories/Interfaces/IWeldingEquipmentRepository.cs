using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IWeldingEquipmentRepository
{
    Task<EquipmentOperationTimeDto> GetEquipmentOperationTimeByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<EquipmentDowntimeDto>> GetDownTimeInfoByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    );

    Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWelderIdAndDatePeriodAsync(
        Guid welderId,
        DateTime startDate,
        DateTime endDate
    );

    Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWorkplaceIdAndDatePeriodAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    );

    Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByProductionAreaIdAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    );

    Task<WelderOperationTimeDto> GetWelderOperationTimeInfoByWorkshopIdAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    );
}
