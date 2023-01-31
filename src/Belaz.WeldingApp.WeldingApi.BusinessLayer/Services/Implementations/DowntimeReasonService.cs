using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class DowntimeReasonService : IDowntimeReasonService
{
    private readonly IDowntimeReasonRepository _downtimeReasonRepository;

    public DowntimeReasonService(IDowntimeReasonRepository downtimeReasonRepository)
    {
        _downtimeReasonRepository = downtimeReasonRepository;
    }

    public Task<List<DowntimeReasonDto>> GetAllAsync()
    {
        return _downtimeReasonRepository.GetAllAsync();
    }
}