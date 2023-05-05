using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IWorkshopRepository
{
    Task<WorkshopBriefDto> GetBriefInfoByIdAsync(Guid id);
}