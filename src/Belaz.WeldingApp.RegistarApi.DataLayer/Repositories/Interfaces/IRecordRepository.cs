using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IRecordRepository
{
    Task<WeldingRecord> CreateRecordWithoutTaskAsync(WeldingRecord record);
    
    Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync();
}
