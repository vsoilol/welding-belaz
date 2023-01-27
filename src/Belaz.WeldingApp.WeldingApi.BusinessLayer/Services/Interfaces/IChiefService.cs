using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Chief;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IChiefService
{
    Task<List<ChiefDto>> GetAllAsync();
        
    Task<Result<ChiefDto>> CreateAsync(CreateChiefRequest request);
    
    Task<Result<ChiefDto>> UpdateAsync(UpdateChiefRequest request);
}