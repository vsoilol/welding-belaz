using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;

public interface IExtensionRepository
{
    ProductStructureDto GetProductStructureByMainProductId(
        Guid mainProductId,
        IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
        IReadOnlyCollection<ProductBriefDto> products);
}