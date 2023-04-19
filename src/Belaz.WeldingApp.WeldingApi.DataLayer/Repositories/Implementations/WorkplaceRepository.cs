using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.Common.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WorkplaceRepository : IWorkplaceRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WorkplaceRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WorkplaceDto>> GetAllAsync()
    {
        return _context.Workplaces
            .ProjectTo<WorkplaceDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<WorkplaceDto> GetByIdAsync(Guid id)
    {
        return _context.Workplaces
            .Where(_ => _.Id == id)
            .ProjectTo<WorkplaceDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<WorkplaceDto> CreateAsync(Workplace entity)
    {
        var newWorkplace = _context.Workplaces.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newWorkplace.Id);
    }

    public async Task<WorkplaceDto> UpdateAsync(Workplace entity)
    {
        var updatedWorkplace = (
            await _context.Workplaces.FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedWorkplace.Number = entity.Number;
        updatedWorkplace.ProductionAreaId = entity.ProductionAreaId;
        updatedWorkplace.PostId = entity.PostId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedWorkplace = (await _context.Workplaces.FirstOrDefaultAsync(_ => _.Id == id))!;

        _context.Workplaces.Remove(deletedWorkplace);
        await _context.SaveChangesAsync();
    }
}
