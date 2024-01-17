using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingRecordRepository
{
    Task<List<RecordDto>> GetAllAsync();

    Task<List<RecordDto>> GetAllWithDeviationsAsync();

    Task DeleteAsync(Guid id);

    Task<WeldingRecordLimitDto> UpdateWeldingRecordLimitAsync(WeldingRecordLimit entity);

    Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync();

    Task<List<RecordDto>> GetRecordsByDatePeriodAsync(DateTime startDate, DateTime endDate, string? seamNumber,
        int? weldingTaskNumber, Guid? welderId, Guid? masterId, Guid? equipmentId);

    Task<List<WeldingRecord>> GetRecordsByDateAsync(DateTime date, TimeSpan? startTime, TimeSpan? endTime, Guid? welderId,
        Guid? equipmentId);

    Task SetSequenceNumberToWeldingRecordsAsync(List<Guid> weldingRecordIds, string sequenceNumber);
}