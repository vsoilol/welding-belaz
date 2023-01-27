using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IDowntimeReasonService
{
    Task<List<DowntimeReasonDto>> GetAllAsync();
}