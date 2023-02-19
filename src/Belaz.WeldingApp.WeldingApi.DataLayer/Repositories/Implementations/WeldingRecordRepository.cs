using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingRecordRepository : IWeldingRecordRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingRecordRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<RecordDto>> GetAllAsync()
    {
        return _context.WeldingRecords
            .OrderByDescending(_ => _.Date.Date)
            .ThenBy(x => x.WeldingStartTime.Seconds)
            .ProjectTo<RecordDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}