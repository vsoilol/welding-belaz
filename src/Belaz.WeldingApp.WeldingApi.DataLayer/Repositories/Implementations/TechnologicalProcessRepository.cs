using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class TechnologicalProcessRepository : ITechnologicalProcessRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public TechnologicalProcessRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<TechnologicalProcessDto> GetByIdAsync(Guid id)
    {
        return _context.TechnologicalProcesses
            .Where(_ => _.Id == id)
            .ProjectTo<TechnologicalProcessDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public Task<List<TechnologicalProcessDto>> GetAllAsync()
    {
        return _context.TechnologicalProcesses
            .ProjectTo<TechnologicalProcessDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<TechnologicalProcessDto> CreateAsync(TechnologicalProcess entity)
    {
        var newTechnologicalProcess = _context.TechnologicalProcesses.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newTechnologicalProcess.Id);
    }

    public async Task<TechnologicalProcessDto> UpdateAsync(TechnologicalProcess entity)
    {
        var updatedTechnologicalProcess = (
            await _context.TechnologicalProcesses.FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedTechnologicalProcess.Number = entity.Number;
        updatedTechnologicalProcess.Name = entity.Name;
        updatedTechnologicalProcess.PdmSystemFileLink = entity.PdmSystemFileLink;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedTechnologicalProcess = (
            await _context.TechnologicalProcesses
                .Include(_ => _.Products)
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.TechnologicalProcesses.Remove(deletedTechnologicalProcess);
        await _context.SaveChangesAsync();
    }

    private IQueryable<TechnologicalProcess> GetTechnologicalProcessesIncludesByFilter(
        Expression<Func<TechnologicalProcess, bool>>? filter = null
    )
    {
        IQueryable<TechnologicalProcess> technologicalProcesses = _context.TechnologicalProcesses
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductMain!.MainProduct.ProductMain!.MainProduct)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductInsides)
            .ThenInclude(_ => _.InsideProduct)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.Seams)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductionArea.Workshop)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.Seams)
            .ThenInclude(_ => _.ProductionArea!.Workshop);

        if (filter is not null)
        {
            technologicalProcesses = technologicalProcesses.Where(filter);
        }

        return technologicalProcesses;
    }
}