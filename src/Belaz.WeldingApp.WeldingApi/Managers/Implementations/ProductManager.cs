﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Product;
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
    
    public async Task<List<ProductDto>> GetAllByWeldingTaskStatus(Status status)
    {
        return await _productRepository
            .AsQueryable()
            .Where(_ => _.WeldingTask.Status == status)
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
}