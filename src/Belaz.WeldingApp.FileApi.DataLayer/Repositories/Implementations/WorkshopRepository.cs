using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class WorkshopRepository : IWorkshopRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WorkshopRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public Task<WorkshopBriefDto> GetBriefInfoByIdAsync(Guid id)
    {
        return _context.Workshops.Where(_ => _.Id == id)
            .ProjectTo<WorkshopBriefDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}