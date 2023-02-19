using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWeldingRecordService
{
    Task<List<RecordDto>> GetAllAsync();
}