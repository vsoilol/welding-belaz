using AutoMapper;
using AutoMapper.QueryableExtensions;
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

    public Task<List<ProductDto>> GetAllProductsByWeldingTaskStatus(Status status)
    {
        throw new NotImplementedException();
    }

    public Task<List<ProductDto>> GetAllDetailsByWeldingTaskStatus(Status status)
    {
        throw new NotImplementedException();
    }

    public Task<List<ProductDto>> GetAllKnotsByWeldingTaskStatus(Status status)
    {
        throw new NotImplementedException();
    }

    public async Task<List<ProductDto>> GetAllProductsByControlSubject(bool isControlSubject)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == ProductType.Product)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<ProductDto>> GetAllDetailsByControlSubject(bool isControlSubject)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == ProductType.Detail)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<ProductDto>> GetAllKnotsByControlSubject(bool isControlSubject)
    {
        var data = await _productRepository
            .AsQueryable()
            .Include(_ => _.ProductInsides)
            .Include(_ => _.ProductMains)
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == ProductType.Knot)
            .ToListAsync();
        
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == ProductType.Knot)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<ProductDto?> GetProductByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<ProductDto?> GetDetailByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<ProductDto?> GetKnotByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }
}