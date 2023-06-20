using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class SeamRepository : ISeamRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public SeamRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<SeamBriefDto> GetSeamByIdAsync(Guid id)
    {
        return _context.Seams
            .Where(_ => _.Id == id)
            .ProjectTo<SeamBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<Guid> GetSeamIdByWeldingTaskIdAsync(Guid weldingTaskId)
    {
        var weldingTask = (await _context.WeldingTasks
            .Include(_ => _.SeamAccount)
            .FirstOrDefaultAsync(_ => _.Id == weldingTaskId))!;

        return weldingTask.SeamAccount.SeamId;
    }
}