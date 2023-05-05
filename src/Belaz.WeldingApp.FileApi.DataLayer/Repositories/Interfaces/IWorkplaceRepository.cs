using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IWorkplaceRepository
{
    Task<WorkplaceBriefDto> GetBriefInfoByIdAsync(Guid id);
}