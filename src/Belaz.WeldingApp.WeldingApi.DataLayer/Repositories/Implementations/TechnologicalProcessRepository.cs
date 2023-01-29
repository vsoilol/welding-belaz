using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
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
        var updatedTechnologicalProcess = (await _context.TechnologicalProcesses
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedTechnologicalProcess.Number = entity.Number;
        updatedTechnologicalProcess.Name = entity.Name;
        updatedTechnologicalProcess.PdmSystemFileLink = entity.PdmSystemFileLink;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }
}