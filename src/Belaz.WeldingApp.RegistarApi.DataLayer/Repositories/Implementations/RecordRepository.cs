using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class RecordRepository : IRecordRepository
{
    private readonly ApplicationContext _context;

    public RecordRepository(ApplicationContext context)
    {
        _context = context;
    }

    public async Task<WeldingRecord> CreateRecordWithoutTaskAsync(WeldingRecord record)
    {
        var newRecord = _context.WeldingRecords.Add(record).Entity;
        await _context.SaveChangesAsync();

        return newRecord;
    }
}
