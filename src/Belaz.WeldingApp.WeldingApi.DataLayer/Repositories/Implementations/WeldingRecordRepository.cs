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

    public async Task<List<RecordDto>> GetAllAsync()
    {
        var weldingRecords = await FilterWeldingRecords()
            .OrderByDescending(_ => _.Date.Date)
            .ThenBy(x => x.WeldingStartTime.Seconds)
            .ToListAsync();

        var mapWeldingRecords = _mapper.Map<List<RecordDto>>(weldingRecords);

        return mapWeldingRecords;
    }

    private IQueryable<WeldingRecord> FilterWeldingRecords(
        Expression<Func<WeldingRecord, bool>> filter
    )
    {
        var weldingRecords = _context.WeldingRecords
            .Include(_ => _.Welder)
            .Include(_ => _.Master)
            .Include(_ => _.WeldingEquipment)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.TechnologicalInstruction)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Post)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _.Workshop)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Workplaces)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Inspector)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Master)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Welder)
            .ThenInclude(_ => _!.UserInfo)
            .Where(filter);

        return weldingRecords;
    }

    private IQueryable<WeldingRecord> FilterWeldingRecords()
    {
        var weldingRecords = _context.WeldingRecords
            .Include(_ => _.Welder)
            .Include(_ => _.Master)
            .Include(_ => _.WeldingEquipment)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Seam)
            .ThenInclude(_ => _.TechnologicalInstruction)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Post)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _.Workshop)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Workplaces)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Inspector)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Master)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.WeldPassage)
            .ThenInclude(_ => _!.WeldingTask)
            .ThenInclude(_ => _.Welder)
            .ThenInclude(_ => _!.UserInfo);

        return weldingRecords;
    }
}
