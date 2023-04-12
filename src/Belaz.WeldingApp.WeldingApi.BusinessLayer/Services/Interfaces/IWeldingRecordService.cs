using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingRecord;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingRecordService
{
    Task<List<RecordDto>> GetAllAsync();

    Task<Result<Unit>> DeleteAsync(DeleteWeldingRecordRequest request);
}
