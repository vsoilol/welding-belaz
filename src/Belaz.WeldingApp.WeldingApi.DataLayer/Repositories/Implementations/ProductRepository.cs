using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
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
        var products = await FilterProducts(_ => _.ProductType == productType).ToListAsync();

        var mapProducts = _mapper.Map<List<ProductDto>>(products);

        return mapProducts;
    }

    public async Task<ProductDto> GetByIdAsync(Guid id)
    {
        var product = await FilterProducts(_ => _.Id == id).FirstOrDefaultAsync();

        var mapProduct = _mapper.Map<ProductDto>(product);

        return mapProduct;
    }

    public async Task<List<ProductDto>> GetAllByMasterIdAsync(
        Guid masterId,
        ProductType productType
    )
    {
        var products = await FilterProducts(
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
        var products = await FilterProducts(
                _ => _.InspectorId == inspectorId && _.ProductType == productType
            )
            .ToListAsync();

        var mapProducts = _mapper.Map<List<ProductDto>>(products);

        return mapProducts;
    }

    public async Task<ProductDto> CreateAsync(
        Product entity,
        IReadOnlyList<Guid>? seamIds,
        IReadOnlyList<Guid>? insideProductIds
    )
    {
        entity.Seams = await GetSeamsByIdsAsync(seamIds);
        entity.ProductInsides = await GetInsideProductsByProductIdsAsync(insideProductIds);

        var newProduct = _context.Products.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newProduct.Id);
    }

    public async Task<ProductDto> UpdateAsync(
        Product entity,
        IReadOnlyList<Guid>? seamIds,
        IReadOnlyList<Guid>? insideProductIds
    )
    {
        var updatedProduct = (
            await _context.Products
                .Include(_ => _.ProductInsides)
                .FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedProduct.Name = entity.Name;
        updatedProduct.ProductType = entity.ProductType;
        updatedProduct.Number = entity.Number;
        updatedProduct.IsControlSubject = entity.IsControlSubject;
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

    public async Task AssignProductToWeldersAsync(Guid productId, List<Guid> welderIds)
    {
        var product = (
            await _context.Products
                .Include(_ => _.Welders)
                .FirstOrDefaultAsync(_ => _.Id == productId)
        )!;

        var welders = await _context.Welders
            .Where(_ => welderIds.Any(welderId => welderId == _.Id))
            .ToListAsync();

        product.Welders = welders;

        await _context.SaveChangesAsync();
    }

    public async Task<List<ProductDto>> GetAllByWelderId(Guid welderId, ProductType productType)
    {
        var products = await FilterProducts(
                _ => _.Welders.Any(welder => welder.Id == welderId) && _.ProductType == productType
            )
            .ToListAsync();

        var mapProducts = _mapper.Map<List<ProductDto>>(products);

        return mapProducts;
    }

    private async Task<List<Seam>> GetSeamsByIdsAsync(IReadOnlyList<Guid>? seamIds)
    {
        return seamIds is not null
            ? await _context.Seams.Where(_ => seamIds.Any(seamId => seamId == _.Id)).ToListAsync()
            : new List<Seam>();
    }

    private async Task<List<ProductInside>> GetInsideProductsByProductIdsAsync(
        IReadOnlyList<Guid>? productIds
    )
    {
        return productIds is not null
            ? await _context.Products
                .Where(_ => productIds.Any(productId => productId == _.Id))
                .Select(_ => new ProductInside { InsideProduct = _ })
                .ToListAsync()
            : new List<ProductInside>();
    }

    private IQueryable<Product> FilterProducts(Expression<Func<Product, bool>> filter)
    {
        var products = _context.Products
            .Include(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.ProductInsides)
            .ThenInclude(_ => _.InsideProduct)
            .Include(_ => _.Seams)
            .Include(_ => _.ProductionArea)
            .ThenInclude(_ => _.Workshop)
            .Include(_ => _.TechnologicalProcess)
            .Where(filter);

        return products;
    }
}
