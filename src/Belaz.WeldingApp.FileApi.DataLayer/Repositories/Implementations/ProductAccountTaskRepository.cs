using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class ProductAccountTaskRepository : IProductAccountTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;
    private readonly IExtensionRepository _extensionRepository;

    public ProductAccountTaskRepository(ApplicationContext context, IMapper mapper,
        IExtensionRepository extensionRepository)
    {
        _context = context;
        _mapper = mapper;
        _extensionRepository = extensionRepository;
    }
    
    public async Task<ProductAccountTaskDto> GetProductAccountTaskById(Guid id)
    {
        var productAccountTasksQuery = _context.ProductAccountTasks
            .Where(_ => _.Id == id);

        var productAccountTask = await productAccountTasksQuery
            .ProjectTo<ProductAccountTaskDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();

        var productInsideIds = await _context.ProductInsides
            .ProjectTo<ProductInsideOnlyIdDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var products = await _context.Products
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var productStructure = _extensionRepository
            .GetProductStructureByMainProductId(productAccountTask.MainProductId, productInsideIds, products);

        productAccountTask.Product = productStructure.Product;
        productAccountTask.Detail = productStructure.Detail;
        productAccountTask.Knot = productStructure.Knot;

        return productAccountTask;
    }
}