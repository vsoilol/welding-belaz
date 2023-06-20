using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class RecordRepository : IRecordRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public RecordRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<WeldingRecord> CreateRecordWithoutTaskAsync(WeldingRecord record)
    {
        var newRecord = _context.WeldingRecords.Add(record).Entity;
        await _context.SaveChangesAsync();

        return newRecord;
    }

    public Task<WeldingRecordLimitDto> GetWeldingRecordLimitAsync()
    {
        return _context.WeldingRecordLimits
            .ProjectTo<WeldingRecordLimitDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}
