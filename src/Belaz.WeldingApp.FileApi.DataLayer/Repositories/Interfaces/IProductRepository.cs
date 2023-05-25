using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IProductRepository
{
    Task<ProductBriefDto> GetBriefInfoByIdAsync(Guid id);
    
    Task<List<ProductBriefDto>> GetAllProductsAsync();
}