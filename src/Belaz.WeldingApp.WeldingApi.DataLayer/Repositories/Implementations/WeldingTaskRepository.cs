using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingTaskRepository : IWeldingTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingTaskRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync()
    {
        return _context.WeldingTasks
            .ProjectTo<WeldingTaskFullNamesDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldingTaskRegistrarInfoDto>> GetAllRegistrarInfoAsync()
    {
        return _context.WeldingTasks
            .ProjectTo<WeldingTaskRegistrarInfoDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}