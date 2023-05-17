using System.Linq.Expressions;
using AutoMapper;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductAccountRepository : IProductAccountRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ProductAccountRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task AssignProductAccountToWeldingEquipmentsAsync(
        Guid productAccountId,
        List<Guid> weldingEquipmentIds
    )
    {
        var productAccount = (
            await _context.ProductAccounts
                .Include(_ => _.WeldingEquipments)
                .FirstOrDefaultAsync(_ => _.Id == productAccountId)
        )!;

        var weldingEquipments = await _context.WeldingEquipments
            .Where(_ => weldingEquipmentIds.Any(weldingEquipmentId => weldingEquipmentId == _.Id))
            .ToListAsync();

        productAccount.WeldingEquipments = weldingEquipments;

        await _context.SaveChangesAsync();
    }

    public async Task<ProductAccountDto> ChangAcceptedAmountAsync(
        Guid id,
        Guid inspectorId,
        int acceptedAmount
    )
    {
        var inspector = (await _context.Inspectors.FirstOrDefaultAsync(_ => _.Id == inspectorId))!;

        var productAccount = (
            await _context.ProductAccounts
                .Include(_ => _.ProductResults)
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        var weldingTasks = _context.WeldingTasks.Where(_ => _.SeamAccount.ProductAccountId == id);

        await weldingTasks.ForEachAsync(_ => { _.InspectorId = inspector.Id; });

        var productResultAccept = productAccount.ProductResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Accept
        )!;
        var productResultDefective = productAccount.ProductResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Defective
        )!;
        var productResultManufactured = productAccount.ProductResults.FirstOrDefault(
            _ => _.Status == ResultProductStatus.Manufactured
        )!;

        productResultAccept.Amount = acceptedAmount;
        productResultDefective.Amount =
            productResultManufactured.Amount > acceptedAmount
                ? productResultManufactured.Amount - acceptedAmount
                : 0;

        var seamAccounts = await _context.SeamAccounts
            .Include(_ => _.SeamResults)
            .Where(_ => _.ProductAccountId == id)
            .ToListAsync();

        foreach (var seamAccount in seamAccounts)
        {
            var seamResultAccept = seamAccount.SeamResults.FirstOrDefault(
                _ => _.Status == ResultProductStatus.Accept
            )!;
            var seamResultDefective = seamAccount.SeamResults.FirstOrDefault(
                _ => _.Status == ResultProductStatus.Defective
            )!;

            seamResultAccept.Amount = acceptedAmount;
            seamResultDefective.Amount = productResultDefective.Amount;
        }

        await _context.SaveChangesAsync();

        return await GetByIdAsync(id);
    }

    public async Task<ProductAccountDto> AddProductAccountAsync(Guid productId, DateTime date, int? uniqueNumber)
    {
        var maxProductAccountNumber = await _context.ProductAccounts
            .Where(_ => _.DateFromPlan == date)
            .Select(_ => _.Number)
            .MaxAsync();

        var seams = await _context.Seams
            .Where(_ => _.ProductId == productId)
            .ToListAsync();

        var productResultStatus = new List<ProductResult>
        {
            new() { Amount = 0, Status = ResultProductStatus.Manufactured },
            new() { Amount = 0, Status = ResultProductStatus.Accept },
            new() { Amount = 0, Status = ResultProductStatus.Defective }
        };

        var seamAccounts = new List<SeamAccount>();

        foreach (var seam in seams)
        {
            var seamResultStatus = new List<SeamResult>
            {
                new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                new() { Amount = 0, Status = ResultProductStatus.Accept },
                new() { Amount = 0, Status = ResultProductStatus.Defective }
            };

            var seamAccount = new SeamAccount
            {
                DateFromPlan = date,
                Seam = seam,
                SeamResults = seamResultStatus
            };
            seamAccounts.Add(seamAccount);
        }

        var newProductAccount = new ProductAccount
        {
            Number = maxProductAccountNumber + 1,
            AmountFromPlan = uniqueNumber is null ? 0 : 1,
            DateFromPlan = date,
            ProductId = productId,
            ProductResults = productResultStatus,
            SeamAccounts = seamAccounts,
            UniqueNumber = uniqueNumber
        };

        var entity = _context.ProductAccounts.Add(newProductAccount);
        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Entity.Id);
    }

    public async Task<ProductAccountDto> SetUniqueNumberAsync(Guid productAccountId, int? uniqueNumber)
    {
        var productAccount = (await _context.ProductAccounts
            .FirstOrDefaultAsync(_ => _.Id == productAccountId))!;

        productAccount.UniqueNumber = uniqueNumber;

        if (uniqueNumber is not null)
        {
            productAccount.AmountFromPlan = 1;   
        }

        await _context.SaveChangesAsync();

        return await GetByIdAsync(productAccountId);
    }

    public async Task RemoveProductAccountAsync(Guid id)
    {
        var weldingTasks = await _context.WeldingTasks
            .Where(_ => _.SeamAccount.ProductAccountId == id)
            .ToListAsync();

        _context.WeldingTasks.RemoveRange(weldingTasks);

        var seamAccounts = await _context.SeamAccounts
            .Where(_ => _.ProductAccountId == id)
            .ToListAsync();

        _context.SeamAccounts.RemoveRange(seamAccounts);

        var productAccount = (await _context.ProductAccounts
            .Include(_ => _.Product)
            .FirstOrDefaultAsync(_ => _.Id == id))!;

        var date = productAccount.DateFromPlan;
        var productionAreaId = productAccount.Product.ProductionAreaId;
        
        _context.ProductAccounts.Remove(productAccount!);
        await _context.SaveChangesAsync();

        var productAccounts = await _context.ProductAccounts.Where(_ =>
            _.DateFromPlan == date && 
            _.Product.ProductionAreaId == productionAreaId)
            .OrderBy(_ => _.Number)
            .ToListAsync();

        for (var i = 0; i < productAccounts.Count; i++)
        {
            productAccounts[i].Number = i + 1;
        }
        
        await _context.SaveChangesAsync();
    }

    public async Task<ProductAccountDto> ChangAmountFromPlanAsync(Guid id, int amountFromPlan)
    {
        var productAccount = (await _context.ProductAccounts.FirstOrDefaultAsync(_ => _.Id == id))!;

        if (productAccount.UniqueNumber is null)
        {
            productAccount.AmountFromPlan = amountFromPlan;
            await _context.SaveChangesAsync();
        }

        return await GetByIdAsync(id);
    }

    public async Task<ProductAccountDto> ChangeManufacturedAmountAsync(
        Guid id,
        int manufacturedAmount
    )
    {
        var productResults = (
            await _context.ProductResults.FirstOrDefaultAsync(
                _ => _.Status == ResultProductStatus.Manufactured && _.ProductAccountId == id
            )
        )!;

        productResults.Amount = manufacturedAmount;

        var seamResults = (
            await _context.SeamResults
                .Where(
                    _ =>
                        _.Status == ResultProductStatus.Manufactured
                        && _.SeamAccount.ProductAccountId == id
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

    public async Task<List<ProductAccountDto>> ChangeOrderAsync(Guid idFirst, Guid idSecond)
    {
        var firstProductAccount = (
            await _context.ProductAccounts
                .Include(_ => _.Product)
                .FirstOrDefaultAsync(_ => _.Id == idFirst)
        )!;
        var secondProductAccount = (
            await _context.ProductAccounts.FirstOrDefaultAsync(_ => _.Id == idSecond)
        )!;

        var temp = firstProductAccount.Number;
        firstProductAccount.Number = secondProductAccount.Number;
        secondProductAccount.Number = temp;

        await _context.SaveChangesAsync();

        return await GetAllByDateAsync(
            firstProductAccount.DateFromPlan,
            firstProductAccount.Product.ProductionAreaId
        );
    }

    public async Task<List<ProductAccountDto>> GenerateByDateAsync(
        DateTime date,
        DateTime newDate,
        Guid productionAreaId
    )
    {
        var oldProductAccounts = _context.ProductAccounts.Where(
            _ =>
                _.Product.ProductionAreaId == productionAreaId
                && _.DateFromPlan.Date.Equals(newDate.Date)
        );

        _context.ProductAccounts.RemoveRange(oldProductAccounts);

        await _context.SaveChangesAsync();

        var productAccounts = await _context.ProductAccounts
            .Include(_ => _.Product)
            .Include(_ => _.WeldingEquipments)
            .Include(_ => _.SeamAccounts)
            .ThenInclude(_ => _.Seam)
            .Where(
                _ =>
                    _.Product.ProductionAreaId == productionAreaId
                    && _.DateFromPlan.Date.Equals(date.Date)
            )
            .ToListAsync();

        var newProductAccounts = new List<ProductAccount>();
        for (int i = 0; i < productAccounts.Count; i++)
        {
            var productAccount = productAccounts[i];
            var productResultStatus = new List<ProductResult>
            {
                new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                new() { Amount = 0, Status = ResultProductStatus.Accept },
                new() { Amount = 0, Status = ResultProductStatus.Defective }
            };

            var seamAccounts = new List<SeamAccount>();

            foreach (var seamAccount in productAccount.SeamAccounts)
            {
                var seamResultStatus = new List<SeamResult>
                {
                    new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                    new() { Amount = 0, Status = ResultProductStatus.Accept },
                    new() { Amount = 0, Status = ResultProductStatus.Defective }
                };

                var newSeamAccount = new SeamAccount
                {
                    DateFromPlan = newDate,
                    SeamId = seamAccount.SeamId,
                    SeamResults = seamResultStatus
                };
                seamAccounts.Add(newSeamAccount);
            }

            var newProductAccount = new ProductAccount
            {
                Number = productAccount.Number,
                AmountFromPlan = productAccount.AmountFromPlan,
                DateFromPlan = newDate,
                ProductId = productAccount.ProductId,
                ProductResults = productResultStatus,
                SeamAccounts = seamAccounts,
                WeldingEquipments = productAccount.WeldingEquipments
            };
            newProductAccounts.Add(newProductAccount);
        }

        _context.ProductAccounts.AddRange(newProductAccounts);

        await _context.SaveChangesAsync();

        return await GetAllByDateAsync(newDate, productionAreaId);
    }

    public async Task<List<ProductAccountDto>> GenerateEmptyAsync(
        DateTime newDate,
        Guid productionAreaId
    )
    {
        var oldProductAccounts = _context.ProductAccounts.Where(
            _ =>
                _.Product.ProductionAreaId == productionAreaId
                && _.DateFromPlan.Date.Equals(newDate.Date)
        );

        var oldSeamAccounts = _context.SeamAccounts.Where(
            _ =>
                _.Seam.Product.ProductionAreaId == productionAreaId
                && _.DateFromPlan.Date.Equals(newDate.Date)
        );

        _context.ProductAccounts.RemoveRange(oldProductAccounts);
        _context.SeamAccounts.RemoveRange(oldSeamAccounts);

        await _context.SaveChangesAsync();

        var products = await _context.ProductionAreas
            .Where(_ => _.Id == productionAreaId)
            .SelectMany(_ => _.Products)
            .Include(_ => _.Seams)
            .ToListAsync();

        var productAccounts = new List<ProductAccount>();
        for (int i = 0; i < products.Count; i++)
        {
            var product = products[i];
            var productResultStatus = new List<ProductResult>
            {
                new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                new() { Amount = 0, Status = ResultProductStatus.Accept },
                new() { Amount = 0, Status = ResultProductStatus.Defective }
            };

            var seamAccounts = new List<SeamAccount>();

            foreach (var seam in product.Seams)
            {
                var seamResultStatus = new List<SeamResult>
                {
                    new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                    new() { Amount = 0, Status = ResultProductStatus.Accept },
                    new() { Amount = 0, Status = ResultProductStatus.Defective }
                };

                var seamAccount = new SeamAccount
                {
                    DateFromPlan = newDate,
                    Seam = seam,
                    SeamResults = seamResultStatus
                };
                seamAccounts.Add(seamAccount);
            }

            var productAccount = new ProductAccount
            {
                Number = i + 1,
                AmountFromPlan = 0,
                DateFromPlan = newDate,
                Product = product,
                ProductResults = productResultStatus,
                SeamAccounts = seamAccounts
            };
            productAccounts.Add(productAccount);
        }

        _context.ProductAccounts.AddRange(productAccounts);
        await _context.SaveChangesAsync();

        return await GetAllByDateAsync(newDate, productionAreaId);
    }

    public async Task GenerateTasksAsync(DateTime date, Guid productionAreaId, Guid masterId)
    {
        var oldWeldingTask = _context.WeldingTasks.Where(
            _ =>
                _.WeldingDate.Date.Equals(date.Date)
                && _.Master!.UserInfo.ProductionAreaId == productionAreaId
        );

        _context.RemoveRange(oldWeldingTask);
        await _context.SaveChangesAsync();

        var master = (await _context.Masters.FirstOrDefaultAsync(_ => _.Id == masterId))!;

        var seamAccounts = await _context.SeamAccounts
            .Include(_ => _.SeamResults)
            .Include(_ => _.ProductAccount)
            .Include(_ => _.Seam.Inspector)
            .Where(
                _ =>
                    _.DateFromPlan.Date.Equals(date.Date)
                    && _.Seam.Product.ProductionAreaId == productionAreaId
                    && _.ProductAccount.AmountFromPlan > 0
            )
            .OrderBy(_ => _.ProductAccount.Number)
            .ToListAsync();

        var weldingTasks = new List<WeldingTask>();

        foreach (var seamAccount in seamAccounts)
        {
            weldingTasks.Add(
                new WeldingTask
                {
                    WeldingDate = date,
                    Master = master,
                    Inspector = seamAccount.Seam.Inspector,
                    SeamAccount = seamAccount
                }
            );
        }

        _context.WeldingTasks.AddRange(weldingTasks);
        await _context.SaveChangesAsync();
    }

    public async Task<List<ProductAccountDto>> GetAllByDateAsync(
        DateTime date,
        Guid productionAreaId
    )
    {
        var productAccounts = await GetProductAccountsWithIncludesByFilter(
                _ => _.Product.ProductionAreaId == productionAreaId
            )
            .Where(_ => _.DateFromPlan.Date.Equals(date.Date))
            .OrderBy(_ => _.Number)
            .ToListAsync();

        var mapProductAccounts = _mapper.Map<List<ProductAccountDto>>(productAccounts);

        return mapProductAccounts;
    }

    public async Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId)
    {
        return (
                await _context.ProductAccounts
                    .Select(_ => _.DateFromPlan.Date)
                    .Distinct()
                    .OrderBy(_ => _.Date)
                    .ToListAsync()
            )
            .Select(_ => _.ToDayInfoString())
            .ToList();
    }

    public async Task<ProductAccountDto> GetByIdAsync(Guid id)
    {
        var productAccount = await GetProductAccountsWithIncludesByFilter(_ => _.Id == id)
            .FirstOrDefaultAsync();

        var mapProductAccount = _mapper.Map<ProductAccountDto>(productAccount);

        return mapProductAccount;
    }

    public async Task<ProductAccountDto> SetProductAccountDefectiveReasonAsync(
        Guid productAccountId,
        string defectiveReason
    )
    {
        var productAccountDefectiveResult = (
            await _context.ProductResults.FirstOrDefaultAsync(
                _ => _.ProductAccountId == productAccountId
            )
        )!;

        productAccountDefectiveResult.Reason = defectiveReason;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(productAccountId);
    }

    private IQueryable<ProductAccount> GetProductAccountsWithIncludesByFilter(
        Expression<Func<ProductAccount, bool>>? filter = null
    )
    {
        IQueryable<ProductAccount> productAccounts = _context.ProductAccounts
            .Include(_ => _.ProductResults)
            .Include(_ => _.SeamAccounts)
            .ThenInclude(_ => _.WeldingTasks)
            .ThenInclude(_ => _.WeldPassages)
            .Include(_ => _.WeldingEquipments)
            .Include(s => s.Product.ProductMain!.MainProduct.ProductMain!.MainProduct)
            .Include(p => p.Product.ProductInsides)
            .ThenInclude(pi => pi.InsideProduct)
            .Include(s => s.Product.Seams)
            .Include(s => s.Product.ProductionArea.Workshop)
            .Include(s => s.Product.TechnologicalProcess);

        if (filter != null)
        {
            productAccounts = productAccounts.Where(filter);
        }

        return productAccounts;
    }
}