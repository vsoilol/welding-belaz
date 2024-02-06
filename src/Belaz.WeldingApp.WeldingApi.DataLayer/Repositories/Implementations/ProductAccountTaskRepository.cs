using System.Linq;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

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

    public async Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync()
    {
        var productAccountTasksQuery = _context.ProductAccountTasks.Include(_ => _.WeldingTasks);

        var productAccountTasks = await productAccountTasksQuery
            .OrderByDescending(_ => _.DateFromPlan)
            .ProjectTo<ProductAccountTaskDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var productInsideIds = await _context.ProductInsides
            .ProjectTo<ProductInsideOnlyIdDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var products = await _context.Products
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        foreach (var productAccountTask in productAccountTasks)
        {
            var productStructure = _extensionRepository
                .GetProductStructureByMainProductId(productAccountTask.MainProductId, productInsideIds, products);

            productAccountTask.Product = productStructure.Product;
            productAccountTask.Detail = productStructure.Detail;
            productAccountTask.Knot = productStructure.Knot;
        }

        return productAccountTasks;
    }
}