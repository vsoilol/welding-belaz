using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;

public interface IRecordRepository
{
    Task CreateRecordWithoutTaskAsync(WeldingRecord record);
}