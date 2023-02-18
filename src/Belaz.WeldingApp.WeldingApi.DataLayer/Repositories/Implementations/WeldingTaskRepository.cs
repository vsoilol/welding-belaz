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

    public Task<List<WeldingTaskFullNamesDto>> GetAllWithFullNamesAsync()
    {
        return _context.WeldingTasks
            .ProjectTo<WeldingTaskFullNamesDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync()
    {
        return _context.WeldingTasks
            .Where(_ => _.Status != SeamStatus.Accept)
            .ProjectTo<WeldingTaskDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldingTaskDto>> GetAllAsync()
    {
        return _context.WeldingTasks
            .ProjectTo<WeldingTaskDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<WeldingTaskDto> GetByIdAsync(Guid id)
    {
        return _context.WeldingTasks
            .Where(_ => _.Id == id)
            .ProjectTo<WeldingTaskDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<WeldingTaskDto> CreateAsync(WeldingTask entity)
    {
        var newWeldingTask = _context.WeldingTasks.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newWeldingTask.Id);
    }

    public async Task<WeldingTaskDto> UpdateAsync(WeldingTask entity)
    {
        var updatedWeldingTask = (await _context.WeldingTasks
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedWeldingTask.Number = entity.Number;
        updatedWeldingTask.WeldingDate = entity.WeldingDate;
        updatedWeldingTask.BasicMaterial = entity.BasicMaterial;
        updatedWeldingTask.MainMaterialBatchNumber = entity.MainMaterialBatchNumber;
        updatedWeldingTask.WeldingMaterial = entity.WeldingMaterial;
        updatedWeldingTask.WeldingMaterialBatchNumber = entity.WeldingMaterialBatchNumber;
        updatedWeldingTask.ProtectiveGas = entity.ProtectiveGas;
        updatedWeldingTask.ProtectiveGasBatchNumber = entity.ProtectiveGasBatchNumber;
        updatedWeldingTask.SeamId = entity.SeamId;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }
}