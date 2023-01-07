using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class ProductManager : IProductManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Product> _productRepository;

    public ProductManager(IMapper mapper, EntityFrameworkRepository<Product> productRepository)
    {
        _mapper = mapper;
        _productRepository = productRepository;
    }

    public async Task<List<ProductDto>> GetAllByWeldingTaskStatus(Status status, ProductType productType)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.WeldingTask.Status == status && _.ProductType == productType)
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

    public async Task CreateAsync(CreateProductWithoutTypeRequest request, ProductType productType)
    {
        var product = _mapper.Map<Product>(request);
        product.ProductType = productType;

        _productRepository.Add(product);
        await _productRepository.SaveAsync();
    }

    public async Task UpdateAsync(UpdateProductWithoutTypeRequest request)
    {
        var product = _mapper.Map<Product>(request);
        
        _productRepository.Update(product);
        await _productRepository.SaveAsync();
    }
}