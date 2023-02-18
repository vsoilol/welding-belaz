using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductService : IProductService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IProductRepository _productRepository;

    public ProductService(IValidationService validationService, IMapper mapper, IProductRepository productRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _productRepository = productRepository;
    }

    public async Task<Result<List<ProductDto>>> GetAllAsync(GetAllProductsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _productRepository.GetAllAsync(request.Type));
    }

    public async Task<Result<List<ProductDto>>> GetAllByControlSubjectAsync(GetAllByControlSubjectRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _productRepository.GetAllByControlSubjectAsync(request.IsControlSubject, request.Type));
    }

    public async Task<Result<ProductDto>> GetByIdAsync(GetProductByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _productRepository.GetByIdAsync(request.Id));
    }

    public async Task<Result<List<ProductDto>>> GetAllByMasterIdAsync(GetAllByMasterIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _productRepository.GetAllByMasterIdAsync(request.MasterId, request.Type));
    }

    public async Task<Result<List<ProductDto>>> GetAllByInspectorIdAsync(GetAllByInspectorIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _productRepository.GetAllByInspectorIdAsync(request.InspectorId, request.Type));
    }

    public async Task<Result<List<ProductDto>>> GetAllByWelderIdAsync(GetAllProductsByWelderIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _productRepository.GetAllByInspectorIdAsync(request.WelderId, request.Type));
    }

    public async Task<Result<ProductDto>> CreateAsync(CreateProductRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var product = _mapper.Map<Product>(request.Request);
            product.ProductType = request.Type;

            return _productRepository.CreateAsync(product,
                request.Request.Seams,
                request.Request.InsideProducts);
        });
    }

    public async Task<Result<ProductDto>> UpdateAsync(UpdateProductRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var product = _mapper.Map<Product>(request.Request);
            product.ProductType = request.Type;

            return _productRepository.UpdateAsync(product,
                request.Request.Seams,
                request.Request.InsideProducts);
        });
    }

    public async Task<Result<Unit>> AssignProductToMasterAsync(AssignProductToMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _productRepository.AssignProductToMasterAsync(request.ProductId, request.MasterId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignProductToInspectorAsync(AssignProductToInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _productRepository.AssignProductToInspectorAsync(request.ProductId, request.InspectorId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignProductsToMasterAsync(AssignProductsToMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _productRepository.AssignProductsToMasterAsync(request.ProductIds, request.MasterId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignProductsToInspectorAsync(AssignProductsToInspectorRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _productRepository.AssignProductsToInspectorAsync(request.ProductIds, request.InspectorId);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignProductToWeldersAsync(AssignProductToWeldersRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _productRepository.AssignProductToWeldersAsync(request.ProductId, request.WelderIds);
            return Unit.Default;
        });
    }
}