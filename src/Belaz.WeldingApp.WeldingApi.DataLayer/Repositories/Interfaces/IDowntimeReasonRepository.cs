using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IDowntimeReasonRepository
{
    Task<List<DowntimeReasonDto>> GetAllAsync();
}