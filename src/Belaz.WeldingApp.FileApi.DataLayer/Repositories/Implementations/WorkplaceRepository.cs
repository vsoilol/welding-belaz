using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class WorkplaceRepository : IWorkplaceRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WorkplaceRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<WorkplaceBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.Workplaces.Where(_ => _.Id == id)
            .ProjectTo<WorkplaceBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}