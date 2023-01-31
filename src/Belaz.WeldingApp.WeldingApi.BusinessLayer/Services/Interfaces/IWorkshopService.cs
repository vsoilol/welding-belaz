using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWorkshopService
{
    Task<List<WorkshopDto>> GetAllAsync();
    
    Task<Result<WorkshopDto>> GetByIdAsync(GetByIdRequest request);

    Task<Result<WorkshopDto>> CreateAsync(CreateWorkshopRequest request);
    
    Task<Result<WorkshopDto>> UpdateAsync(UpdateWorkshopRequest request);
}