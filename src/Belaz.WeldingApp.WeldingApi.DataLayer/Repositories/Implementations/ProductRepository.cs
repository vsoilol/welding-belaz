using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductRepository : IProductRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ProductRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<ProductDto>> GetAllByControlSubjectAsync(bool isControlSubject, ProductType productType)
    {
        return _context.Products
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductDto>> GetAllByStatusAsync(ProductStatus status, ProductType productType)
    {
        return _context.Products
            .Where(_ => _.Status == status && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<ProductDto> GetByIdAsync(Guid id)
    {
        return _context.Products
            .Where(_ => _.Id == id)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<ProductDto> ChangeStatusAsync(Guid id, ProductStatus status, bool isAddManually)
    {
        var updatedProduct = (await _context.Products
            .FirstOrDefaultAsync(_ => _.Id == id))!;

        updatedProduct.Status = status;
        updatedProduct.IsAddManually = isAddManually;
        
        await _context.SaveChangesAsync();

        return await GetByIdAsync(id);
    }

    public Task<List<ProductDto>> GetAllByMasterIdAsync(Guid masterId, ProductType productType)
    {
        return _context.Products
            .Where(_ => _.MasterId == masterId && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductDto>> GetAllByInspectorIdAsync(Guid inspectorId, ProductType productType)
    {
        return _context.Products
            .Where(_ => _.InspectorId == inspectorId && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<ProductDto> CreateAsync(Product entity, IReadOnlyList<Guid>? seamIds,
        IReadOnlyList<Guid>? insideProductIds)
    {
        entity.Seams = await GetSeamsByIdsAsync(seamIds);
        entity.ProductInsides = await GetInsideProductsByProductIdsAsync(insideProductIds);

        var newProduct = _context.Products.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newProduct.Id);
    }

    public async Task<ProductDto> UpdateAsync(Product entity, IReadOnlyList<Guid>? seamIds,
        IReadOnlyList<Guid>? insideProductIds)
    {
        var updatedProduct = (await _context.Products
            .Include(_ => _.ProductInsides)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedProduct.Name = entity.Name;
        updatedProduct.ProductType = entity.ProductType;
        updatedProduct.Number = entity.Number;
        updatedProduct.IsControlSubject = entity.IsControlSubject;
        updatedProduct.WorkplaceId = entity.WorkplaceId;
        updatedProduct.ProductionAreaId = entity.ProductionAreaId;
        updatedProduct.TechnologicalProcessId = entity.TechnologicalProcessId;

        updatedProduct.Seams = await GetSeamsByIdsAsync(seamIds);
        updatedProduct.ProductInsides = await GetInsideProductsByProductIdsAsync(insideProductIds);

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task AssignProductToMasterAsync(Guid productId, Guid masterId)
    {
        var product = (await _context.Products.FirstOrDefaultAsync(_ => _.Id == productId))!;

        product.MasterId = masterId;

        await _context.SaveChangesAsync();
    }

    public async Task AssignProductToInspectorAsync(Guid productId, Guid inspectorId)
    {
        var product = (await _context.Products.FirstOrDefaultAsync(_ => _.Id == productId))!;

        product.InspectorId = inspectorId;

        await _context.SaveChangesAsync();
    }

    private async Task<List<Seam>> GetSeamsByIdsAsync(IReadOnlyList<Guid>? seamIds)
    {
        return seamIds is not null
            ? await _context.Seams
                .Where(_ => seamIds.Any(seamId => seamId == _.Id))
                .ToListAsync()
            : new List<Seam>();
    }

    private async Task<List<ProductInside>> GetInsideProductsByProductIdsAsync(IReadOnlyList<Guid>? productIds)
    {
        return productIds is not null
            ? await _context.Products
                .Where(_ => productIds.Any(productId => productId == _.Id))
                .Select(_ => new ProductInside
                {
                    InsideProduct = _
                })
                .ToListAsync()
            : new List<ProductInside>();
    }
}