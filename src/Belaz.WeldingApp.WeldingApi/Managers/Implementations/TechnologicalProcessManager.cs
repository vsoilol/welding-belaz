using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class TechnologicalProcessManager : ITechnologicalProcessManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<TechnologicalProcess> _technologicalProcessRepository;

    public TechnologicalProcessManager(IMapper mapper,
        EntityFrameworkRepository<TechnologicalProcess> technologicalProcessRepository)
    {
        _mapper = mapper;
        _technologicalProcessRepository = technologicalProcessRepository;
    }

    public async Task<TechnologicalProcessDto?> GetByIdAsync(Guid id)
    {
        return await _technologicalProcessRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<TechnologicalProcessDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<List<TechnologicalProcessDto>> GetAllAsync()
    {
        return await _technologicalProcessRepository
            .AsQueryable()
            .ProjectTo<TechnologicalProcessDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}