using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface ISeamRepository
{
    Task<SeamBriefDto> GetBriefInfoByIdAsync(Guid id);
}