using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IChiefService
{
    Task<ChiefDto> CreateAsync(CreateChiefRequest request);
}