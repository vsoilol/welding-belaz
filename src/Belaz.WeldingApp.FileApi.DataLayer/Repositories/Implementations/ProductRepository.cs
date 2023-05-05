using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

internal class ProductRepository : IProductRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ProductRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<ProductBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.Products.Where(_ => _.Id == id)
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!; 
    }
}