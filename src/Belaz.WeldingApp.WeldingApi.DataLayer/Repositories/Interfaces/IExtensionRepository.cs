using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IExtensionRepository
{
    ProductStructureDto GetProductStructureByMainProductId(
        Guid mainProductId,
        IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
        IReadOnlyCollection<ProductBriefDto> products);
}