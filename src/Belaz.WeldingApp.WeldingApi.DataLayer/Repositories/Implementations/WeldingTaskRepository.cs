using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingTaskRepository : IWeldingTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingTaskRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync()
    {
        var weldingTasks = await FilterWeldingTasks().ToListAsync();

        var mapWeldingTasks = _mapper.Map<List<WeldingTaskFullNamesDto>>(weldingTasks);

        return mapWeldingTasks;
    }

    public async Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync()
    {
        var weldingTasks = await FilterWeldingTasks(_ => _.Status == SeamStatus.Accept)
            .ToListAsync();

        var mapWeldingTasks = _mapper.Map<List<WeldingTaskDto>>(weldingTasks);

        return mapWeldingTasks;
    }

    public async Task<List<WeldingTaskDto>> GetAllAsync()
    {
        var weldingTasks = await FilterWeldingTasks().ToListAsync();

        var mapWeldingTasks = _mapper.Map<List<WeldingTaskDto>>(weldingTasks);

        return mapWeldingTasks;
    }

    public async Task<WeldingTaskDto> GetByIdAsync(Guid id)
    {
        var weldingTask = await FilterWeldingTasks(_ => _.Id == id).FirstOrDefaultAsync();

        var mapWeldingTask = _mapper.Map<WeldingTaskDto>(weldingTask);

        return mapWeldingTask;
    }

    public async Task<WeldingTaskDto> UpdateAsync(WeldingTask entity)
    {
        var updatedWeldingTask = (
            await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedWeldingTask.BasicMaterial = entity.BasicMaterial;
        updatedWeldingTask.MainMaterialBatchNumber = entity.MainMaterialBatchNumber;
        updatedWeldingTask.WeldingMaterial = entity.WeldingMaterial;
        updatedWeldingTask.WeldingMaterialBatchNumber = entity.WeldingMaterialBatchNumber;
        updatedWeldingTask.ProtectiveGas = entity.ProtectiveGas;
        updatedWeldingTask.ProtectiveGasBatchNumber = entity.ProtectiveGasBatchNumber;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    private IQueryable<WeldingTask> FilterWeldingTasks(Expression<Func<WeldingTask, bool>> filter)
    {
        var weldingTasks = _context.WeldingTasks
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.TechnologicalInstruction)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Post)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _.Workshop)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Workplaces)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Inspector)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.Master)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.Welder)
            .ThenInclude(_ => _!.UserInfo)
            .Where(filter);

        return weldingTasks;
    }

    private IQueryable<WeldingTask> FilterWeldingTasks()
    {
        var weldingTasks = _context.WeldingTasks
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.TechnologicalInstruction)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Post)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _.Workshop)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord)
            .ThenInclude(_ => _.WeldingEquipment)
            .ThenInclude(_ => _.Workplaces)
            .ThenInclude(_ => _!.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Inspector)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.Master)
            .ThenInclude(_ => _!.UserInfo)
            .Include(_ => _.Welder)
            .ThenInclude(_ => _!.UserInfo);

        return weldingTasks;
    }
}
