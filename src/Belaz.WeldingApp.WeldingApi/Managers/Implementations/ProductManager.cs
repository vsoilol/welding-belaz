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
        var data = _productRepository
            .AsQueryable()
            .Include(_ => _.ProductInsides)
            .ThenInclude(_ => _.InsideProduct)
            .Include(_ => _.TechnologicalProcess)
            .Include(_ => _.WeldingTask)
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == ProductType.Product);

        return await _productRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == ProductType.Product)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductDto>> GetAllDetailsByControlSubject(bool isControlSubject)
    {
        throw new NotImplementedException();
    }

    public Task<List<ProductDto>> GetAllKnotsByControlSubject(bool isControlSubject)
    {
        throw new NotImplementedException();
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