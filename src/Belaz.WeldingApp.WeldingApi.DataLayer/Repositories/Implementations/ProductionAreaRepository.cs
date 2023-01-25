using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductioArea;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductionAreaRepository : IProductionAreaRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ProductionAreaRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<ProductionAreaDto>> GetAllAsync()
    {
        return _context.ProductionAreas
            .ProjectTo<ProductionAreaDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}