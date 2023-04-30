using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IChiefService
{
    Task<BaseRequest<List<ChiefDto>>> GetAllAsync();
        
    Task<BaseResultRequest<ChiefDto>> CreateAsync(CreateChiefRequest request);
    
    Task<BaseResultRequest<ChiefDto>> UpdateAsync(UpdateChiefRequest request);
}