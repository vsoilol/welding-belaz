using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductionArea;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
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

    public Task<ProductionAreaDto> GetByIdAsync(Guid id)
    {
        return _context.ProductionAreas
            .Where(_ => _.Id == id)
            .ProjectTo<ProductionAreaDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<ProductionAreaDto> CreateAsync(ProductionArea entity)
    {
        var newProductionArea = _context.ProductionAreas.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newProductionArea.Id);
    }

    public async Task<ProductionAreaDto> UpdateAsync(ProductionArea entity)
    {
        var updatedProductionArea = (await _context.ProductionAreas
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedProductionArea.Name = entity.Name;
        updatedProductionArea.Number = entity.Number;
        updatedProductionArea.WorkshopId = entity.WorkshopId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }
}