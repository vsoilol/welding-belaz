using AutoMapper;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.RegistarApi.Domain.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Implementations;

public class WeldingTaskRepository : IWeldingTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldingTaskRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task ChangeWeldingTaskStatusAsync(Guid id, WeldingTaskStatus status)
    {
        var weldingTask = (await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id))!;

        weldingTask.TaskStatus = status;

        await _context.SaveChangesAsync();
    }

    public async Task<List<WeldingTaskDto>> GetAllTasksByDateAndEquipmentRfidTagAsync(
        DateTime date,
        string equipmentRfidTag
    )
    {
        var weldingTasks = await _context.ProductAccounts
            .OrderBy(_ => _.Number)
            .Where(_ => _.WeldingEquipments.Any(equipment => equipment.RfidTag == equipmentRfidTag))
            .SelectMany(_ => _.Product.Seams)
            .SelectMany(_ => _.WeldingTasks)
            .Where(_ => _.TaskStatus == WeldingTaskStatus.NotStarted)
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
            .ThenInclude(_ => _.TechnologicalInstruction)
            .ThenInclude(_ => _!.WeldPassageInstructions)
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .ToListAsync();

        return _mapper.Map<List<WeldingTaskDto>>(weldingTasks);
    }

    public async Task UpdateSomeInfoAsync(WeldingTask task)
    {
        var weldingTask = (await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == task.Id))!;

        weldingTask.TaskStatus = WeldingTaskStatus.Completed;
        weldingTask.WelderId = task.WelderId;

        await _context.SaveChangesAsync();
    }
}
