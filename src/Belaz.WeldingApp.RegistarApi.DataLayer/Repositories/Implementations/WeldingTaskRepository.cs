using System.Linq.Expressions;
using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.RegistarApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.RegistarApi.Domain.Dtos;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

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

    public async Task UpdateWeldingTaskStatusAsync(Guid id, Guid welderId, WeldingTaskStatus status)
    {
        var weldingTask = (await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id))!;

        weldingTask.TaskStatus = status;
        weldingTask.WelderId = welderId;

        await _context.SaveChangesAsync();
    }

    public async Task<List<WeldingTaskDto>> GetAllTasksByDateEquipmentAndWelderRfidTagAsync(
        DateTime date,
        string equipmentRfid,
        string welderRfid
    )
    {
        var tasksQuery = GetWeldingTasksWithIncludesByFilter(
            task =>
                task.SeamAccount.ProductAccount.WeldingEquipments.Any(
                    eq => eq.RfidTag == equipmentRfid
                )
                && (
                    task.TaskStatus == WeldingTaskStatus.NotStarted
                    || (
                        task.Welder!.UserInfo.RfidTag == welderRfid
                        && task.TaskStatus != WeldingTaskStatus.Completed
                    )
                )
                && task.WeldingDate.Date.Equals(date.Date)
        );

        var tasks = await tasksQuery
            .OrderBy(task => task.SeamAccount.ProductAccount.Number)
            .ToListAsync();

        return _mapper.Map<List<WeldingTaskDto>>(tasks);
    }

    public async Task<WeldingTaskDto> GetTaskByIdAsync(Guid id)
    {
        var weldingTask = await GetWeldingTasksWithIncludesByFilter()
            .FirstOrDefaultAsync(_ => _.Id == id);

        return _mapper.Map<WeldingTaskDto>(weldingTask);
    }

    public async Task MarkWeldingTaskAsCompletedAsync(Guid id)
    {
        var weldingTask = (await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id))!;

        weldingTask.TaskStatus = WeldingTaskStatus.Completed;

        await _context.SaveChangesAsync();
    }

    private IQueryable<WeldingTask> GetWeldingTasksWithIncludesByFilter(
        Expression<Func<WeldingTask, bool>>? filter = null
    )
    {
        IQueryable<WeldingTask> weldingTasks = _context.WeldingTasks
            .Include(
                _ =>
                    _.SeamAccount
                        .Seam
                        .Product
                        .ProductMain!
                        .MainProduct
                        .ProductMain!
                        .MainProduct
                        .ProductMain!
                        .MainProduct
            )
            .Include(_ => _.SeamAccount.Seam.ProductionArea!.Workshop)
            .Include(_ => _.SeamAccount.ProductAccount)
            .Include(_ => _.SeamAccount.Seam.Product.TechnologicalProcess)
            .Include(_ => _.SeamAccount.Seam.TechnologicalInstruction!.WeldPassageInstructions)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Post!.ProductionArea.Workshop)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Workplaces)
            .ThenInclude(_ => _!.ProductionArea!.Workshop)
            .Include(_ => _.Inspector!.UserInfo)
            .Include(_ => _.Master.UserInfo)
            .Include(_ => _.Welder!.UserInfo);

        if (filter != null)
        {
            weldingTasks = weldingTasks.Where(filter);
        }

        return weldingTasks;
    }
}
