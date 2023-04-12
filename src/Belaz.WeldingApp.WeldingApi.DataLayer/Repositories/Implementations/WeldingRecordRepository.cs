using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
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

    public async Task DeleteAsync(Guid id)
    {
        var deletedWeldingRecord = (
            await _context.WeldingRecords.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.WeldingRecords.Remove(deletedWeldingRecord);
        await _context.SaveChangesAsync();
    }

    public async Task<List<RecordDto>> GetAllAsync()
    {
        var weldingRecords = await GetWeldingRecordsWithIncludesByFilter()
            .OrderByDescending(_ => _.Date.Date)
            .ThenByDescending(x => x.WeldingStartTime.TotalSeconds)
            .ToListAsync();

        var mapWeldingRecords = _mapper.Map<List<RecordDto>>(weldingRecords);

        return mapWeldingRecords;
    }

    private IQueryable<WeldingRecord> GetWeldingRecordsWithIncludesByFilter(
        Expression<Func<WeldingRecord, bool>>? filter = null
    )
    {
        IQueryable<WeldingRecord> weldingRecords = _context.WeldingRecords
            .Include(_ => _.Welder.UserInfo)
            .Include(_ => _.Master!.UserInfo)
            .Include(_ => _.WeldingEquipment)
            .Include(
                _ =>
                    _.WeldPassage!
                        .WeldingTask
                        .SeamAccount
                        .Seam
                        .Product
                        .ProductMain!
                        .MainProduct
                        .ProductMain!
                        .MainProduct
                        .ProductMain!
                        .MainProduct
            )
            .Include(_ => _.WeldPassage!.WeldingTask.SeamAccount.ProductAccount)
            .Include(_ => _.WeldPassage!.WeldingTask.SeamAccount.SeamResults)
            .Include(_ => _.WeldPassage!.WeldingTask.SeamAccount.Seam.ProductionArea!.Workshop)
            .Include(_ => _.WeldPassage!.WeldingTask.SeamAccount.Seam.Product.TechnologicalProcess)
            .Include(_ => _.WeldPassage!.WeldingTask.SeamAccount.Seam.TechnologicalInstruction)
            .Include(_ => _.WeldPassage!.WeldingTask.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassage!.WeldingTask.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Post!.ProductionArea.Workshop)
            .Include(_ => _.WeldPassage!.WeldingTask.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Workplaces)
            .ThenInclude(_ => _!.ProductionArea!.Workshop)
            .Include(_ => _.WeldPassage!.WeldingTask.Inspector!.UserInfo)
            .Include(_ => _.WeldPassage!.WeldingTask.Master!.UserInfo)
            .Include(_ => _.WeldPassage!.WeldingTask.Welder!.UserInfo);

        if (filter != null)
        {
            weldingRecords = weldingRecords.Where(filter);
        }

        return weldingRecords;
    }
}
