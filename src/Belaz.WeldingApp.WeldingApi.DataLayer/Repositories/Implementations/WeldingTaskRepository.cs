﻿using System.Linq.Expressions;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingTask;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WeldingTaskRepository : IWeldingTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;
    private readonly IExtensionRepository _extensionRepository;

    public WeldingTaskRepository(ApplicationContext context, IMapper mapper, IExtensionRepository extensionRepository)
    {
        _context = context;
        _mapper = mapper;
        _extensionRepository = extensionRepository;
    }

    public async Task<List<WeldingTaskDto>> GetAllCompletedTaskAsync()
    {
        var weldingTasks = await GetWeldingTasksWithIncludesByFilter(
                _ => _.TaskStatus == WeldingTaskStatus.Completed
            )
            .ToListAsync();

        var mapWeldingTasks = _mapper.Map<List<WeldingTaskDto>>(weldingTasks);

        return mapWeldingTasks;
    }

    public async Task<List<WeldingTaskDto>> GetAllAsync()
    {
        var weldingTasksQuery = _context.WeldingTasks;

        //var mapWeldingTasks = _mapper.Map<List<WeldingTaskDto>>(weldingTasks);

        var weldingTasks = await weldingTasksQuery
            .ProjectTo<WeldingTaskDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var productInsideIds = await _context.ProductInsides
            .ProjectTo<ProductInsideOnlyIdDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var products = await _context.Products
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var weldingTaskWithMainProductIds = await weldingTasksQuery
            .Select(_ => new WeldingTaskWithMainProductIdsDto
            {
                WeldingTaskId = _.Id,
                MainProductId = _.SeamAccount.Seam.ProductId
            })
            .ToListAsync();

        var mainProductIds = weldingTaskWithMainProductIds.Select(_ => _.MainProductId).ToList();

        var productsStructure = _extensionRepository
            .GetProductStructuresByMainProductIds(mainProductIds, productInsideIds, products)
            .ToList();

        foreach (var weldingTaskWithMainProductId in weldingTaskWithMainProductIds)
        {
            var productStructure = productsStructure
                .FirstOrDefault(_ => _.MainProductId == weldingTaskWithMainProductId.MainProductId)!;
            
            var weldingTask = weldingTasks
                .FirstOrDefault(_ => _.Id == weldingTaskWithMainProductId.WeldingTaskId)!;
            
            weldingTask.Product = productStructure.Product;
            weldingTask.Detail = productStructure.Detail;
            weldingTask.Knot = productStructure.Knot;
        }

        /*foreach (var productStructure in productsStructure)
        {
            var productWeldingTasks = weldingTasks
                .Where(_ => _.MainProductId == productStructure.MainProductId);

            foreach (var productWeldingTask in productWeldingTasks)
            {
                productWeldingTask.Product = productStructure.Product;
                productWeldingTask.Detail = productStructure.Detail;
                productWeldingTask.Knot = productStructure.Knot;
            }
        }*/

        return weldingTasks;
    }

    public async Task<WeldingTaskDto> GetByIdAsync(Guid id)
    {
        var weldingTask = await GetWeldingTasksWithIncludesByFilter(_ => _.Id == id)
            .FirstOrDefaultAsync();

        var mapWeldingTask = _mapper.Map<WeldingTaskDto>(weldingTask);

        return mapWeldingTask;
    }

    public async Task<List<WeldingTaskDto>> GetAllUncompletedTaskAsync()
    {
        var weldingTasks = await GetWeldingTasksWithIncludesByFilter(
                _ => _.TaskStatus != WeldingTaskStatus.Completed
            )
            .ToListAsync();

        var mapWeldingTasks = _mapper.Map<List<WeldingTaskDto>>(weldingTasks);

        return mapWeldingTasks;
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

    public async Task<WeldingTaskDto> ChangeWeldingTaskStatusAsync(
        Guid id,
        WeldingTaskStatus status
    )
    {
        var updatedWeldingTask = (
            await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        updatedWeldingTask.TaskStatus = status;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(id);
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedWeldingTask = (
            await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.WeldingTasks.Remove(deletedWeldingTask);
        await _context.SaveChangesAsync();
    }

    public async Task<WeldingTaskDto> ChangeWeldingTaskDateAsync(Guid id, DateTime date)
    {
        var updatedWeldingTask = (
            await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        updatedWeldingTask.WeldingDate = date;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(id);
    }

    public async Task<WeldingTaskDto> ChangeWeldingTaskSeamAmountAsync(Guid id, int seamAmount)
    {
        var updatedWeldingTask = (
            await _context.WeldingTasks.FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        var seamAccount = (
            await _context.SeamAccounts
                .Include(_ => _.SeamResults)
                .FirstOrDefaultAsync(_ => _.WeldingTasks.Any(task => task.Id == id))
        )!;

        var seamManufacteredAmount = seamAccount.SeamResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Manufactured
        )!;

        seamManufacteredAmount.Amount = seamAmount;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(id);
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
            .Include(_ => _.SeamAccount.ProductAccount.WeldingEquipments)
            .Include(_ => _.SeamAccount.SeamResults)
            .Include(_ => _.SeamAccount.Seam.Product.TechnologicalProcess)
            .Include(_ => _.SeamAccount.Seam.TechnologicalInstruction)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Welders)
            .ThenInclude(_ => _.UserInfo)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Post!.ProductionArea.Workshop)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.WeldingRecord.WeldingEquipment.Workplaces)
            .ThenInclude(_ => _!.ProductionArea!.Workshop)
            .Include(_ => _.Inspector!.UserInfo)
            .Include(_ => _.Master!.UserInfo)
            .Include(_ => _.Welder!.UserInfo);

        if (filter != null)
        {
            weldingTasks = weldingTasks.Where(filter);
        }

        return weldingTasks;
    }
}