using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WeldingTaskManager : IWeldingTaskManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<WeldingTask> _weldingTaskRepository;

    public WeldingTaskManager(IMapper mapper, EntityFrameworkRepository<WeldingTask> weldingTaskRepository)
    {
        _mapper = mapper;
        _weldingTaskRepository = weldingTaskRepository;
    }
    
    public async Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync()
    {
        return await _weldingTaskRepository
            .AsQueryable()
            .ProjectTo<WeldingTaskFullNamesDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync()
    {
        return await _weldingTaskRepository
            .AsQueryable()
            .ProjectTo<WeldingTaskRegistrarInfoDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}