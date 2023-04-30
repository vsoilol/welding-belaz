using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
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

    public async Task<BaseRequest<List<DowntimeReasonDto>>> GetAllAsync()
    {
        var data = await _downtimeReasonRepository.GetAllAsync();

        var message = $"Получение всех причин простоя";

        return new BaseRequest<List<DowntimeReasonDto>>(data, message);
    }
}