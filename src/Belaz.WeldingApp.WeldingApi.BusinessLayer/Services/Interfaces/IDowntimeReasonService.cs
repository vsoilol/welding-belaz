using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IDowntimeReasonService
{
    Task<BaseRequest<List<DowntimeReasonDto>>> GetAllAsync();
}