using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.Common.Entities.Production;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductionAreaService
{
    Task<BaseRequest<List<ProductionAreaDto>>> GetAllAsync();

    Task<BaseResultRequest<ProductionAreaDto>> GetByIdAsync(GetProductionAreaByIdRequest request);

    Task<BaseResultRequest<ProductionAreaDto>> CreateAsync(CreateProductionAreaRequest request);

    Task<BaseResultRequest<ProductionAreaDto>> UpdateAsync(UpdateProductionAreaRequest request);

    Task<BaseResultRequest<Unit>> DeleteAsync(DeleteProductionAreaRequest request);
}
