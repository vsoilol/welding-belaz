using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IWeldingRecordRepository
{
    Task<List<RecordDto>> GetAllAsync();

    Task DeleteAsync(Guid id);
}
