using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class ProductManager : IProductManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Product> _productRepository;
    private readonly EntityFrameworkRepository<TechnologicalProcess> _technologicalProcessRepository;
    private readonly EntityFrameworkRepository<Seam> _seamRepository;

    public ProductManager(IMapper mapper, EntityFrameworkRepository<Product> productRepository,
        EntityFrameworkRepository<TechnologicalProcess> technologicalProcessRepository,
        EntityFrameworkRepository<Seam> seamRepository)
    {
        _mapper = mapper;
        _productRepository = productRepository;
        _technologicalProcessRepository = technologicalProcessRepository;
        _seamRepository = seamRepository;
    }

    public async Task<List<ProductDto>> GetAllByWeldingTaskStatus(Status status, ProductType productType)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.Status == status && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<ProductDto>> GetAllByControlSubject(bool isControlSubject, ProductType productType)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<ProductDto?> GetByIdAsync(Guid id)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public Task<List<ProductDto>> GetAllByMasterIdAsync(Guid masterId, ProductType productType)
    {
        return _productRepository
            .AsQueryable()
            .Where(_ => _.MasterId == masterId && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductDto>> GetAllByInspectorIdAsync(Guid inspectorId, ProductType productType)
    {
        return _productRepository
            .AsQueryable()
            .Where(_ => _.InspectorId == inspectorId && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<ProductDto?> CreateAsync(CreateProductWithoutTypeRequest request, ProductType productType)
    {
        var product = _mapper.Map<Product>(request);
        product.ProductType = productType;

        if (request.Seams is not null)
        {
            var seams = await _seamRepository
                .GetByFilterAsync(_ => request.Seams.Any(seamId => seamId == _.Id));
            product.Seams = seams.ToList();
        }

        var createdProduct = _productRepository.Add(product);
        await _productRepository.SaveAsync();

        return await _productRepository
            .AsQueryable()
            .Where(_ => _.Id == createdProduct.Id)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<ProductDto?> UpdateAsync(UpdateProductWithoutTypeRequest request, ProductType productType)
    {
        var updatedProduct = await _productRepository
            .AsQueryable()
            .Include(_ => _.ProductInsides)
            .FirstOrDefaultAsync(_ => _.Id == request.Id);

        updatedProduct.Name = request.Name ?? updatedProduct.Name;
        updatedProduct.Number = request.Number ?? updatedProduct.Number;
        updatedProduct.IsControlSubject = request.IsControlSubject ?? updatedProduct.IsControlSubject;
        updatedProduct.WorkplaceId = request.WorkplaceId ?? updatedProduct.WorkplaceId;
        updatedProduct.ProductionAreaId = request.ProductionAreaId ?? updatedProduct.ProductionAreaId;

        if (request.TechnologicalProcessId is not null)
        {
            updatedProduct.TechnologicalProcess =
                await _technologicalProcessRepository.GetByIdAsync((Guid)request.TechnologicalProcessId);
        }

        if (request.Seams is not null)
        {
            var seams = await _seamRepository
                .GetByFilterAsync(_ => request.Seams.Any(seamId => seamId == _.Id));
            updatedProduct.Seams = seams.ToList();
        }

        if (request.InsideProducts is not null)
        {
            updatedProduct.ProductInsides = request.InsideProducts.Select(_ => new ProductInside
            {
                InsideProductId = _,
            }).ToList();
        }

        await _productRepository.SaveAsync();

        return await _productRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task AssignProductToMasterAsync(AssignProductToMasterRequest request)
    {
        var product = await _productRepository.GetByIdAsync(request.ProductId);

        product.InspectorId = request.MasterId;

        await _productRepository.SaveAsync();
    }

    public async Task AssignProductToInspectorAsync(AssignProductToInspectorRequest request)
    {
        var product = await _productRepository.GetByIdAsync(request.ProductId);

        product.InspectorId = request.InspectorId;

        await _productRepository.SaveAsync();
    }
}