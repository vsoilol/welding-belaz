using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class ProductionAreaRepository : IProductionAreaRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ProductionAreaRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<ProductionAreaBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.ProductionAreas.Where(_ => _.Id == id)
            .ProjectTo<ProductionAreaBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}