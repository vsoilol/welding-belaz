using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IWorkplaceService
{
    Task<List<WorkplaceDto>> GetAllAsync();

    Task<Result<WorkplaceDto>> GetByIdAsync(GetWorkplaceByIdRequest request);

    Task<Result<WorkplaceDto>> CreateAsync(CreateWorkplaceRequest request);

    Task<Result<WorkplaceDto>> UpdateAsync(UpdateWorkplaceRequest request);

    Task<Result<Unit>> DeleteAsync(DeleteWorkplaceRequest request);
}
