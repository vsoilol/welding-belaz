using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ConditionTimeInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IWeldingEquipmentRepository
{
    Task<EquipmentOperationTimeDto> GetEquipmentOperationTimeByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetEquipmentConditionTimeByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<EquipmentDowntimeDto>> GetDownTimeInfoByIdAndDatePeriodAsync(
        Guid id,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetConditionTimeByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetConditionTimeByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetConditionTimeByDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetOnConditionTimeByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetOnConditionTimeByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetOnConditionTimeByDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    );

    Task<List<ConditionTimeDto>> GetOnConditionTimeByWorkplaceAndDatePeriodAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    );

    Task<WeldingEquipmentBriefDto> GetBriefInfoByIdAsync(Guid id);

    Task<List<Guid>> GetWeldingEquipmentIdsAsync();

    Task<List<Guid>> GetWeldingEquipmentIdsByProductionAreaAsync(Guid productionAreaId);

    Task<List<Guid>> GetWeldingEquipmentIdsByWorkplaceAsync(Guid workplaceId);

    Task<List<Guid>> GetWeldingEquipmentIdsByWorkshopAsync(Guid workshopId);
}