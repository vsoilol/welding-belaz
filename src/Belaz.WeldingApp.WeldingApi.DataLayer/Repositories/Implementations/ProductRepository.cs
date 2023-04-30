using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;

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

    public Task<List<ProductDto>> GetAllByControlSubjectAsync(
        bool isControlSubject,
        ProductType productType
    )
    {
        return _context.Products
            .Where(_ => _.IsControlSubject == isControlSubject && _.ProductType == productType)
            .ProjectTo<ProductDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<ProductDto>> GetAllAsync(ProductType productType)
    {
        var products = await GetProductsWithIncludesByFilter(_ => _.ProductType == productType)
            .ToListAsync();

        var mapProducts = _mapper.Map<List<ProductDto>>(products);

        return mapProducts;
    }

    public async Task<ProductDto> GetByIdAsync(Guid id)
    {
        var product = await GetProductsWithIncludesByFilter(_ => _.Id == id).FirstOrDefaultAsync();

        var mapProduct = _mapper.Map<ProductDto>(product);

        return mapProduct;
    }

    public Task<ProductBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.Products
            .Where(_ => _.Id == id)
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<List<ProductDto>> GetAllByMasterIdAsync(
        Guid masterId,
        ProductType productType
    )
    {
        var products = await GetProductsWithIncludesByFilter(
                _ => _.MasterId == masterId && _.ProductType == productType
            )
            .ToListAsync();

        var mapProducts = _mapper.Map<List<ProductDto>>(products);

        return mapProducts;
    }

    public async Task<List<ProductDto>> GetAllByInspectorIdAsync(
        Guid inspectorId,
        ProductType productType
    )
    {
        var products = await GetProductsWithIncludesByFilter(
                _ => _.InspectorId == inspectorId && _.ProductType == productType
            )
            .ToListAsync();

        var mapProducts = _mapper.Map<List<ProductDto>>(products);

        return mapProducts;
    }

    public async Task<ProductDto> CreateAsync(Product entity, Guid? mainProductId)
    {
        var mainProduct = await _context.Products
            .Where(_ => _.Id == mainProductId)
            .Select(_ => new ProductInside { MainProduct = _ })
            .FirstOrDefaultAsync();

        entity.ProductMain = mainProduct;

        var newProduct = _context.Products.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newProduct.Id);
    }

    public async Task<ProductDto> UpdateAsync(Product entity, Guid? mainProductId)
    {
        var updatedProduct = (
            await _context.Products
                .Include(_ => _.ProductMain)
                .FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        var mainProduct = await _context.Products
            .Where(_ => _.Id == mainProductId)
            .Select(_ => new ProductInside { MainProduct = _ })
            .FirstOrDefaultAsync();

        updatedProduct.Name = entity.Name;
        updatedProduct.ProductType = entity.ProductType;
        updatedProduct.Number = entity.Number;
        updatedProduct.IsControlSubject = entity.IsControlSubject;
        updatedProduct.ProductionAreaId = entity.ProductionAreaId;
        updatedProduct.TechnologicalProcessId = entity.TechnologicalProcessId;
        updatedProduct.ManufacturingTime = entity.ManufacturingTime;

        updatedProduct.ProductMain = mainProduct;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task AssignProductToMasterAsync(Guid productId, Guid masterId)
    {
        var product = (await _context.Products.FirstOrDefaultAsync(_ => _.Id == productId))!;

        product.MasterId = masterId;

        await _context.SaveChangesAsync();
    }

    public async Task AssignProductsToMasterAsync(List<Guid> productIds, Guid masterId)
    {
        var master = (await _context.Masters.FirstOrDefaultAsync(_ => _.Id == masterId))!;
        var products = await _context.Products
            .Where(_ => productIds.Any(productId => productId == _.Id) || _.MasterId == master.Id)
            .ToListAsync();

        master.Products = products;

        await _context.SaveChangesAsync();
    }

    public async Task AssignProductToInspectorAsync(Guid productId, Guid inspectorId)
    {
        var product = (await _context.Products.FirstOrDefaultAsync(_ => _.Id == productId))!;

        product.InspectorId = inspectorId;

        await _context.SaveChangesAsync();
    }

    public async Task AssignProductsToInspectorAsync(List<Guid> productIds, Guid inspectorId)
    {
        var inspector = (await _context.Inspectors.FirstOrDefaultAsync(_ => _.Id == inspectorId))!;
        var products = await _context.Products
            .Where(
                _ => productIds.Any(productId => productId == _.Id) || _.InspectorId == inspector.Id
            )
            .ToListAsync();

        inspector.Products = products;

        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedProductInside = _context.ProductInsides.Where(
            _ => _.MainProductId == id || _.InsideProductId == id
        );
        _context.ProductInsides.RemoveRange(deletedProductInside);

        var deletedProduct = (await _context.Products.FirstOrDefaultAsync(_ => _.Id == id))!;

        _context.Products.Remove(deletedProduct);
        await _context.SaveChangesAsync();
    }

    private IQueryable<Product> GetProductsWithIncludesByFilter(
        Expression<Func<Product, bool>>? filter = null
    )
    {
        IQueryable<Product> products = _context.Products
            .Include(s => s.ProductMain!.MainProduct.ProductMain!.MainProduct)
            .Include(p => p.ProductInsides)
            .ThenInclude(pi => pi.InsideProduct)
            .Include(s => s.Seams)
            .Include(s => s.ProductionArea.Workshop)
            .Include(s => s.TechnologicalProcess);

        if (filter != null)
        {
            products = products.Where(filter);
        }

        return products;
    }
}
