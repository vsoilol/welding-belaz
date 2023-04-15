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
}
