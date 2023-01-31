using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class DowntimeReasonRepository : IDowntimeReasonRepository
{
    private readonly IMapper _mapper;
    private readonly ApplicationContext _context;

    public DowntimeReasonRepository(IMapper mapper, ApplicationContext context)
    {
        _mapper = mapper;
        _context = context;
    }

    public Task<List<DowntimeReasonDto>> GetAllAsync()
    {
        return _context.DowntimeReasons
            .ProjectTo<DowntimeReasonDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}