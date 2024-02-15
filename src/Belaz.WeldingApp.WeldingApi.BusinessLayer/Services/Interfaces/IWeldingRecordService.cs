using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingRecordService
{
    Task<List<RecordDto>> GetAllAsync();
    
    Task<Result<List<RecordDto>>> GetRecordsByDatePeriodAsync(GetRecordsByDatePeriodRequest request);

    Task<List<RecordDto>> GetAllWithDeviationsAsync();

    Task<Result<Unit>> DeleteAsync(DeleteWeldingRecordRequest request);
    
    Task<Result<WeldingRecordLimitDto>> UpdateWeldingRecordLimitAsync(UpdateWeldingRecordLimitRequest request);
    
    Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync();

    Task<Result<Unit>> SetSequenceNumberToWeldingRecordsAsync(SetSequenceNumberToWeldingRecordsRequest request);

    Task<Result<RecordBriefDto>> GetRecordValuesByDateAsync(GetRecordValuesByDateRequest request);

    Task<PaginatedList<RecordDto>> GetFilteredRecordsAsync(GetFilteredWeldingRecordsRequest request);
}
