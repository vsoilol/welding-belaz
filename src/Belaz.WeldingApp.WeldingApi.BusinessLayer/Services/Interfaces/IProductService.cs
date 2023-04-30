using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using LanguageExt;
using LanguageExt.Common;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;

public interface IProductService
{
    Task<BaseResultRequest<List<ProductDto>>> GetAllAsync(GetAllProductsRequest request);

    Task<BaseResultRequest<List<ProductDto>>> GetAllByControlSubjectAsync(
        GetAllByControlSubjectRequest request
    );

    Task<BaseResultRequest<ProductDto>> GetByIdAsync(GetProductByIdRequest request);

    Task<BaseResultRequest<List<ProductDto>>> GetAllByMasterIdAsync(GetAllByMasterIdRequest request);

    Task<BaseResultRequest<List<ProductDto>>> GetAllByInspectorIdAsync(GetAllByInspectorIdRequest request);

    Task<BaseResultRequest<ProductDto>> CreateAsync(CreateProductRequest request);

    Task<BaseResultRequest<ProductDto>> UpdateAsync(UpdateProductRequest request);

    Task<BaseResultRequest<Unit>> AssignProductToMasterAsync(AssignProductToMasterRequest request);

    Task<BaseResultRequest<Unit>> AssignProductToInspectorAsync(AssignProductToInspectorRequest request);

    Task<BaseResultRequest<Unit>> AssignProductsToMasterAsync(AssignProductsToMasterRequest request);

    Task<BaseResultRequest<Unit>> AssignProductsToInspectorAsync(AssignProductsToInspectorRequest request);

    Task<BaseResultRequest<Unit>> DeleteAsync(DeleteProductRequest request);
}
