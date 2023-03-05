using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
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

    public async Task<TechnologicalProcessDto> GetByIdAsync(Guid id)
    {
        var technologicalProcess = await FilterTechnologicalProcesses(_ => _.Id == id)
            .FirstOrDefaultAsync();

        var mapTechnologicalProcess = _mapper.Map<TechnologicalProcessDto>(technologicalProcess);

        return mapTechnologicalProcess;
    }

    public async Task<List<TechnologicalProcessDto>> GetAllAsync()
    {
        var technologicalProcesses = await FilterTechnologicalProcesses().ToListAsync();

        var mapTechnologicalProcesses = _mapper.Map<List<TechnologicalProcessDto>>(
            technologicalProcesses
        );

        return mapTechnologicalProcesses;
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

    private IQueryable<TechnologicalProcess> FilterTechnologicalProcesses(
        Expression<Func<TechnologicalProcess, bool>> filter
    )
    {
        var technologicalProcesses = _context.TechnologicalProcesses
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductInsides)
            .ThenInclude(_ => _.InsideProduct)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.Seams)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _.Workshop)
            .Where(filter);

        return technologicalProcesses;
    }

    private IQueryable<TechnologicalProcess> FilterTechnologicalProcesses()
    {
        var technologicalProcesses = _context.TechnologicalProcesses
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductInsides)
            .ThenInclude(_ => _.InsideProduct)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.Seams)
            .Include(_ => _.Products)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _.Workshop);

        return technologicalProcesses;
    }
}
