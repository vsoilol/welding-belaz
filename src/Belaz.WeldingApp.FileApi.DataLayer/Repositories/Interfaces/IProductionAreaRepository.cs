using Belaz.WeldingApp.FileApi.Domain.Dtos;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IProductionAreaRepository
{
    Task<ProductionAreaBriefDto> GetBriefInfoByIdAsync(Guid id);
    
    Task<ProductionAreaBriefDto?> GetBriefInfoByNumberAndWorkshopNumberAsync(int number, int workshopNumber);
}