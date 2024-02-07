using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Product;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Welder;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductAccountTaskRepository : IProductAccountTaskRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;
    private readonly IExtensionRepository _extensionRepository;

    public ProductAccountTaskRepository(ApplicationContext context, IMapper mapper,
        IExtensionRepository extensionRepository)
    {
        _context = context;
        _mapper = mapper;
        _extensionRepository = extensionRepository;
    }

    public async Task<List<ProductAccountTaskDto>> GetAllProductAccountTasksAsync()
    {
        var productAccountTasksQuery = _context.ProductAccountTasks;

        var productAccountTasks = await productAccountTasksQuery
            .OrderByDescending(_ => _.DateFromPlan)
            .ProjectTo<ProductAccountTaskDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var productInsideIds = await _context.ProductInsides
            .ProjectTo<ProductInsideOnlyIdDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var products = await _context.Products
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        foreach (var productAccountTask in productAccountTasks)
        {
            productAccountTask.Welders = productAccountTask.Welders
                .GroupBy(e => e.Id) // Replace YourIdField with the field you want to be unique
                .Select(g => g.FirstOrDefault()!)
                .ToList();

            var productStructure = _extensionRepository
                .GetProductStructureByMainProductId(productAccountTask.MainProductId, productInsideIds, products);

            productAccountTask.Product = productStructure.Product;
            productAccountTask.Detail = productStructure.Detail;
            productAccountTask.Knot = productStructure.Knot;
        }

        return productAccountTasks;
    }

    public async Task AssignProductAccountTaskToWeldingEquipmentsAsync(Guid productAccountTaskId,
        List<Guid> weldingEquipmentIds)
    {
        var productAccountTask = (
            await _context.ProductAccountTasks
                .Include(_ => _.WeldingEquipments)
                .FirstOrDefaultAsync(_ => _.Id == productAccountTaskId)
        )!;

        var weldingEquipments = await _context.WeldingEquipments
            .Where(_ => weldingEquipmentIds.Any(weldingEquipmentId => weldingEquipmentId == _.Id))
            .ToListAsync();

        productAccountTask.WeldingEquipments = weldingEquipments;

        await _context.SaveChangesAsync();
    }

    public async Task<ProductAccountTaskDto> ChangeEndWeldingDateAsync(Guid productAccountTaskId,
        DateTime? weldingEndDate)
    {
        var productAccountTask = (await _context.ProductAccountTasks
            .FirstOrDefaultAsync(_ => _.Id == productAccountTaskId))!;

        productAccountTask.EndDateFromPlan = weldingEndDate;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(productAccountTaskId);
    }

    public async Task<ProductAccountTaskDto> ChangeDefectiveAmountAsync(Guid productAccountTaskId,
        Guid inspectorId, int defectiveAmount, string? defectiveReason)
    {
        var inspector = (await _context.Inspectors.FirstOrDefaultAsync(_ => _.Id == inspectorId))!;

        var productAccountTask =
            (await _context.ProductAccountTasks.FirstOrDefaultAsync(_ => _.Id == productAccountTaskId))!;

        productAccountTask.InspectorId = inspectorId;

        var weldingTasks = _context.WeldingTasks
            .Where(_ => _.ProductAccountTaskId == productAccountTaskId);

        await weldingTasks.ForEachAsync(_ => { _.InspectorId = inspector.Id; });

        productAccountTask.DefectiveAmount = defectiveAmount;
        productAccountTask.AcceptedAmount =
            productAccountTask.ManufacturedAmount > defectiveAmount
                ? productAccountTask.ManufacturedAmount - defectiveAmount
                : 0;
        productAccountTask.Reason = defectiveReason;

        var seamAccounts = await _context.SeamAccounts
            .Include(_ => _.SeamResults)
            .Where(_ => _.ProductAccountId == productAccountTask.ProductAccountId)
            .ToListAsync();

        foreach (var seamAccount in seamAccounts)
        {
            var seamResultAccept = seamAccount.SeamResults.FirstOrDefault(
                _ => _.Status == ResultProductStatus.Accept
            )!;
            var seamResultDefective = seamAccount.SeamResults.FirstOrDefault(
                _ => _.Status == ResultProductStatus.Defective
            )!;

            seamResultDefective.Amount = defectiveAmount;
            seamResultAccept.Amount = productAccountTask.AcceptedAmount;
        }

        await _context.SaveChangesAsync();
        return await GetByIdAsync(productAccountTaskId);
    }

    public async Task<ProductAccountTaskDto> ChangeManufacturedAmountAsync(Guid id, int manufacturedAmount)
    {
        var productAccountTask = (await _context.ProductAccountTasks.FirstOrDefaultAsync(_ => _.Id == id))!;

        productAccountTask.ManufacturedAmount = manufacturedAmount;

        var seamResults = (
            await _context.SeamResults
                .Where(
                    _ =>
                        _.Status == ResultProductStatus.Manufactured
                        && _.SeamAccount.ProductAccountId == productAccountTask.ProductAccountId
                )
                .ToListAsync()
        )!;

        foreach (var seamResult in seamResults)
        {
            seamResult.Amount = manufacturedAmount;
        }

        await _context.SaveChangesAsync();

        return await GetByIdAsync(id);
    }

    public async Task<ProductAccountTaskDto> UpdateWeldingMaterialInfoAsync(Guid id, string? weldingMaterial,
        string? weldingMaterialBatchNumber)
    {
        var productAccountTask = (await _context.ProductAccountTasks.FirstOrDefaultAsync(_ => _.Id == id))!;

        productAccountTask.WeldingMaterial = weldingMaterial;
        productAccountTask.WeldingMaterialBatchNumber = weldingMaterialBatchNumber;

        await _context.SaveChangesAsync();
        return await GetByIdAsync(id);
    }

    private async Task<ProductAccountTaskDto> GetByIdAsync(Guid id)
    {
        var productAccountTasksQuery = _context.ProductAccountTasks
            .Where(_ => _.Id == id);

        var productAccountTask = await productAccountTasksQuery
            .ProjectTo<ProductAccountTaskDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();

        var productInsideIds = await _context.ProductInsides
            .ProjectTo<ProductInsideOnlyIdDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        var products = await _context.Products
            .ProjectTo<ProductBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();

        productAccountTask!.Welders = productAccountTask.Welders
            .GroupBy(e => e.Id) // Replace YourIdField with the field you want to be unique
            .Select(g => g.FirstOrDefault()!)
            .ToList();

        var productStructure = _extensionRepository
            .GetProductStructureByMainProductId(productAccountTask.MainProductId, productInsideIds, products);

        productAccountTask.Product = productStructure.Product;
        productAccountTask.Detail = productStructure.Detail;
        productAccountTask.Knot = productStructure.Knot;

        return productAccountTask;
    }
}