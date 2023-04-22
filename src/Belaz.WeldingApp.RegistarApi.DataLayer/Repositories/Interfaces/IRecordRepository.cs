using Belaz.WeldingApp.Common.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IRecordRepository
{
    Task<WeldingRecord> CreateRecordWithoutTaskAsync(WeldingRecord record);
}
