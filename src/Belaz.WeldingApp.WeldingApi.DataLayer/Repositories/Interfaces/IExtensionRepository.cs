using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;

public interface IExtensionRepository
{
    IEnumerable<ProductStructureDto> GetProductStructuresByMainProductIds(
        IReadOnlyCollection<Guid> mainProductIds,
        IReadOnlyCollection<ProductInsideOnlyIdDto> productInsideIds,
        IReadOnlyCollection<ProductBriefDto> products);
}