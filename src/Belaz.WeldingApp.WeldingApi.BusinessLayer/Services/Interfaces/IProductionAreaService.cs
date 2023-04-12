using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductionAreaService
{
    Task<List<ProductionAreaDto>> GetAllAsync();

    Task<Result<ProductionAreaDto>> GetByIdAsync(GetProductionAreaByIdRequest request);

    Task<Result<ProductionAreaDto>> CreateAsync(CreateProductionAreaRequest request);

    Task<Result<ProductionAreaDto>> UpdateAsync(UpdateProductionAreaRequest request);

    Task<Result<Unit>> DeleteAsync(DeleteProductionAreaRequest request);
}
