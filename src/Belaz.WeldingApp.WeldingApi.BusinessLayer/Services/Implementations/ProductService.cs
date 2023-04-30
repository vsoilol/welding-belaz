using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Product;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class ProductService : IProductService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IProductRepository _productRepository;
    private readonly IMasterRepository _masterRepository;
    private readonly IInspectorRepository _inspectorRepository;

    public ProductService(
        IValidationService validationService,
        IMapper mapper,
        IProductRepository productRepository,
        IMasterRepository masterRepository,
        IInspectorRepository inspectorRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _productRepository = productRepository;
        _masterRepository = masterRepository;
        _inspectorRepository = inspectorRepository;
    }

    public async Task<BaseResultRequest<List<ProductDto>>> GetAllAsync(GetAllProductsRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<List<ProductDto>>(validationResult.Exception);
            return new BaseResultRequest<List<ProductDto>>(result);
        }

        var data = await _productRepository.GetAllAsync(request.Type);

        var title = request.Type switch
        {
            ProductType.Product => "изделий",
            ProductType.Knot => "узлов",
            ProductType.Detail => "деталей",
            _ => ""
        };

        var message = $"Получение всех {title}";

        return new BaseResultRequest<List<ProductDto>>(data, message);
    }

    public async Task<BaseResultRequest<List<ProductDto>>> GetAllByControlSubjectAsync(
        GetAllByControlSubjectRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<List<ProductDto>>(validationResult.Exception);
            return new BaseResultRequest<List<ProductDto>>(result);
        }

        var data = await _productRepository.GetAllByControlSubjectAsync(
            request.IsControlSubject,
            request.Type
        );

        var title = request.Type switch
        {
            ProductType.Product => "изделий",
            ProductType.Knot => "узлов",
            ProductType.Detail => "деталей",
            _ => ""
        };
        var controlSubjectText = request.IsControlSubject ? "подлежат" : "не подлежат";
        var message = $@"Получение всех {title} которые {controlSubjectText} контролю";

        return new BaseResultRequest<List<ProductDto>>(data, message);
    }

    public async Task<BaseResultRequest<ProductDto>> GetByIdAsync(GetProductByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<ProductDto>(validationResult.Exception);
            return new BaseResultRequest<ProductDto>(result);
        }

        var data = await _productRepository.GetByIdAsync(request.Id);
        var message = $"Получение информации по {data.Name} {data.Number}";

        return new BaseResultRequest<ProductDto>(data, message);
    }

    public async Task<BaseResultRequest<List<ProductDto>>> GetAllByMasterIdAsync(
        GetAllByMasterIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<List<ProductDto>>(validationResult.Exception);
            return new BaseResultRequest<List<ProductDto>>(result);
        }

        var data = await _productRepository.GetAllByMasterIdAsync(request.MasterId, request.Type);

        var master = await _masterRepository.GetUserFullNameByIdAsync(request.MasterId);

        var title = request.Type switch
        {
            ProductType.Product => "изделий",
            ProductType.Knot => "узлов",
            ProductType.Detail => "деталей",
            _ => ""
        };
        var message = $"Получение всех {title} закрепленных за мастером " +
                      $"{master.MiddleName} {master.FirstName} {master.LastName}";

        return new BaseResultRequest<List<ProductDto>>(data, message);
    }

    public async Task<BaseResultRequest<List<ProductDto>>> GetAllByInspectorIdAsync(
        GetAllByInspectorIdRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<List<ProductDto>>(validationResult.Exception);
            return new BaseResultRequest<List<ProductDto>>(result);
        }

        var data = await _productRepository.GetAllByInspectorIdAsync(request.InspectorId, request.Type);

        var inspector = await _inspectorRepository.GetUserFullNameByIdAsync(request.InspectorId);

        var title = request.Type switch
        {
            ProductType.Product => "изделий",
            ProductType.Knot => "узлов",
            ProductType.Detail => "деталей",
            _ => ""
        };
        var message = $"Получение всех {title} закрепленных за контролёром " +
                      $"{inspector.MiddleName} {inspector.FirstName} {inspector.LastName}";

        return new BaseResultRequest<List<ProductDto>>(data, message);
    }

    public async Task<BaseResultRequest<ProductDto>> CreateAsync(CreateProductRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<ProductDto>(validationResult.Exception);
            return new BaseResultRequest<ProductDto>(result);
        }

        var product = _mapper.Map<Product>(request.Request);
        product.ProductType = request.Type;

        var data = await _productRepository.CreateAsync(product, request.Request.MainProductId);
        var title = request.Type switch
        {
            ProductType.Product => "изделия",
            ProductType.Knot => "узла",
            ProductType.Detail => "детали",
            _ => ""
        };
        var message = $"Добавление нового {title}: {data.Name} {data.Number}";

        return new BaseResultRequest<ProductDto>(data, message);
    }

    public async Task<BaseResultRequest<ProductDto>> UpdateAsync(UpdateProductRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<ProductDto>(validationResult.Exception);
            return new BaseResultRequest<ProductDto>(result);
        }

        var product = _mapper.Map<Product>(request.Request);
        product.ProductType = request.Type;

        var data = await _productRepository.UpdateAsync(product, request.Request.MainProductId);
        var message = $"Обновление информации о {data.Name} {data.Number}";

        return new BaseResultRequest<ProductDto>(data, message);
    }

    public async Task<BaseResultRequest<Unit>> AssignProductToMasterAsync(AssignProductToMasterRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        await _productRepository.AssignProductToMasterAsync(
            request.ProductId,
            request.MasterId
        );

        var product = await _productRepository.GetBriefInfoByIdAsync(request.ProductId);
        var master = await _masterRepository.GetUserFullNameByIdAsync(request.MasterId);

        var message = $"Закрепление {product.Name} {product.Number} за " +
                      $"{master.MiddleName} {master.FirstName} {master.LastName}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }

    public async Task<BaseResultRequest<Unit>> AssignProductToInspectorAsync(
        AssignProductToInspectorRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        await _productRepository.AssignProductToInspectorAsync(
            request.ProductId,
            request.InspectorId
        );
        
        var product = await _productRepository.GetBriefInfoByIdAsync(request.ProductId);
        var inspector = await _inspectorRepository.GetUserFullNameByIdAsync(request.InspectorId);

        var message = $"Закрепление {product.Name} {product.Number} за " +
                      $"{inspector.MiddleName} {inspector.FirstName} {inspector.LastName}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }

    public async Task<BaseResultRequest<Unit>> AssignProductsToMasterAsync(
        AssignProductsToMasterRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        await _productRepository.AssignProductsToMasterAsync(
            request.ProductIds,
            request.MasterId
        );
        
        var master = await _masterRepository.GetUserFullNameByIdAsync(request.MasterId);

        var message = $"Закрепление продукции за " +
                      $"{master.MiddleName} {master.FirstName} {master.LastName}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }

    public async Task<BaseResultRequest<Unit>> AssignProductsToInspectorAsync(
        AssignProductsToInspectorRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        await _productRepository.AssignProductsToInspectorAsync(
            request.ProductIds,
            request.InspectorId
        );
        
        var inspector = await _inspectorRepository.GetUserFullNameByIdAsync(request.InspectorId);

        var message = $"Закрепление продукции за " +
                      $"{inspector.MiddleName} {inspector.FirstName} {inspector.LastName}";

        return new BaseResultRequest<Unit>(Unit.Default, message);
    }

    public async Task<BaseResultRequest<Unit>> DeleteAsync(DeleteProductRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            var result = new Result<Unit>(validationResult.Exception);
            return new BaseResultRequest<Unit>(result);
        }

        var deletedProduct = await _productRepository.GetBriefInfoByIdAsync(request.Id);
        await _productRepository.DeleteAsync(request.Id);

        var message = $"Удаление {deletedProduct.Name} {deletedProduct.Number}";
        return new BaseResultRequest<Unit>(Unit.Default, message);
    }
}