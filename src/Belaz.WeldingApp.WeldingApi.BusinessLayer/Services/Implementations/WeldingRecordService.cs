using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WeldingRecordService : IWeldingRecordService
{
    private readonly IWeldingRecordRepository _weldingRecordRepository;

    public WeldingRecordService(IWeldingRecordRepository weldingRecordRepository)
    {
        _weldingRecordRepository = weldingRecordRepository;
    }

    public Task<List<RecordDto>> GetAllAsync()
    {
        return _weldingRecordRepository.GetAllAsync();
    }
}