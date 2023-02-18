using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.ProductInfo;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class RecordRepository : IRecordRepository
{
    private readonly ApplicationContext _context;

    public RecordRepository(ApplicationContext context)
    {
        _context = context;
    }

    public async Task CreateRecordWithoutTaskAsync(WeldingRecord record)
    {
        _context.WeldingRecords.Add(record);
        await _context.SaveChangesAsync();
    }
}