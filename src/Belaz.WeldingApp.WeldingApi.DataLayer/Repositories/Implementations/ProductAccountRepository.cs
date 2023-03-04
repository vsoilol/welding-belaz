using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

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

    public async Task<ProductAccountDto> ChangAcceptedAmountAsync(Guid id, int acceptedAmount)
    {
        var productAccount = (
            await _context.ProductAccounts
                .Include(_ => _.ProductResults)
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;

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
            acceptedAmount > productResultManufactured.Amount
                ? acceptedAmount - productResultManufactured.Amount
                : 0;

        var seamsAccount = await _context.SeamAccounts
            .Include(_ => _.SeamResults)
            .Where(
                _ =>
                    _.Seam.ProductId == productAccount.ProductId
                    && _.DateFromPlan.Date.Equals(productAccount.DateFromPlan.Date)
            )
            .ToListAsync();

        foreach (var seamAccount in seamsAccount)
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

    public async Task<ProductAccountDto> ChangAmountFromPlanAsync(Guid id, int amountFromPlan)
    {
        var productAccount = (await _context.ProductAccounts.FirstOrDefaultAsync(_ => _.Id == id))!;

        productAccount.AmountFromPlan = amountFromPlan;

        await _context.SaveChangesAsync();

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

        var oldSeamAccounts = _context.SeamAccounts.Where(
            _ =>
                _.Seam.Product.ProductionAreaId == productionAreaId
                && _.DateFromPlan.Date.Equals(newDate.Date)
        );

        _context.ProductAccounts.RemoveRange(oldProductAccounts);
        _context.SeamAccounts.RemoveRange(oldSeamAccounts);

        await _context.SaveChangesAsync();

        var newProductAccounts = (
            await _context.ProductAccounts
                .Include(_ => _.Product)
                .ThenInclude(_ => _.Seams)
                .Include(_ => _.WeldingEquipments)
                .Where(
                    _ =>
                        _.Product.ProductionAreaId == productionAreaId
                        && _.DateFromPlan.Date.Equals(date.Date)
                )
                .OrderBy(_ => _.Number)
                .ToListAsync()
        ).Select(
            (_, index) =>
                new ProductAccount
                {
                    Number = index + 1,
                    AmountFromPlan = _.AmountFromPlan,
                    DateFromPlan = newDate,
                    Product = _.Product,
                    ProductResults = new List<ProductResult>
                    {
                        new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                        new() { Amount = 0, Status = ResultProductStatus.Accept },
                        new() { Amount = 0, Status = ResultProductStatus.Defective }
                    },
                    WeldingEquipments = _.WeldingEquipments
                }
        );

        var seamAccounts = newProductAccounts
            .SelectMany(_ => _.Product.Seams)
            .Select(
                (_, index) =>
                    new SeamAccount
                    {
                        DateFromPlan = DateTime.Now,
                        Seam = _,
                        SeamResults = new List<SeamResult>
                        {
                            new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                            new() { Amount = 0, Status = ResultProductStatus.Accept },
                            new() { Amount = 0, Status = ResultProductStatus.Defective }
                        }
                    }
            );

        _context.ProductAccounts.AddRange(newProductAccounts);
        _context.SeamAccounts.AddRange(seamAccounts);

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

        var products = await _context.Products
            .Include(_ => _.Seams)
            .Where(_ => _.ProductionAreaId == productionAreaId)
            .ToListAsync();

        var newProductAccounts = products.Select(
            (_, index) =>
                new ProductAccount
                {
                    Number = index + 1,
                    AmountFromPlan = 0,
                    DateFromPlan = newDate,
                    Product = _,
                    ProductResults = new List<ProductResult>
                    {
                        new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                        new() { Amount = 0, Status = ResultProductStatus.Accept },
                        new() { Amount = 0, Status = ResultProductStatus.Defective }
                    }
                }
        );

        var seamAccounts = products
            .SelectMany(_ => _.Seams)
            .Select(
                (_, index) =>
                    new SeamAccount
                    {
                        DateFromPlan = DateTime.Now,
                        Seam = _,
                        SeamResults = new List<SeamResult>
                        {
                            new() { Amount = 0, Status = ResultProductStatus.Manufactured },
                            new() { Amount = 0, Status = ResultProductStatus.Accept },
                            new() { Amount = 0, Status = ResultProductStatus.Defective }
                        }
                    }
            );

        _context.ProductAccounts.AddRange(newProductAccounts);
        _context.SeamAccounts.AddRange(seamAccounts);

        await _context.SaveChangesAsync();

        return await GetAllByDateAsync(newDate, productionAreaId);
    }

    public async Task GenerateTasksAsync(DateTime date, Guid productionAreaId, Guid userId)
    {
        var oldWeldingTask = _context.WeldingTasks.Where(
            _ =>
                _.WeldingDate.Date.Equals(date.Date)
                && _.Master.UserInfo.ProductionAreaId == productionAreaId
        );

        _context.RemoveRange(oldWeldingTask);
        await _context.SaveChangesAsync();

        var master = (await _context.Masters.FirstOrDefaultAsync(_ => _.UserId == userId))!;

        var productAccounts = await _context.ProductAccounts
            .Include(_ => _.Product)
            .ThenInclude(_ => _.Seams)
            .Include(_ => _.Product)
            .ThenInclude(_ => _.Inspector)
            .Where(
                _ =>
                    _.Product.ProductionAreaId == productionAreaId
                    && _.DateFromPlan.Date.Equals(date.Date)
            )
            .ToListAsync();

        var weldingTasks = new List<WeldingTask>();

        foreach (var productAccount in productAccounts)
        {
            for (int i = 0; i < productAccount.AmountFromPlan; i++)
            {
                foreach (var seam in productAccount.Product.Seams)
                {
                    weldingTasks.Add(
                        new WeldingTask
                        {
                            WeldingDate = date,
                            Master = master,
                            Inspector = seam.Inspector,
                            Seam = seam
                        }
                    );
                }
            }
        }

        _context.WeldingTasks.AddRange(weldingTasks);
        await _context.SaveChangesAsync();
    }

    public Task<List<ProductAccountDto>> GetAllByDateAsync(DateTime date, Guid productionAreaId)
    {
        return _context.Products
            .Where(_ => _.ProductionAreaId == productionAreaId)
            .SelectMany(_ => _.ProductAccounts)
            .Where(_ => _.DateFromPlan.Date.Equals(date.Date))
            .OrderBy(_ => _.Number)
            .ProjectTo<ProductAccountDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId)
    {
        return (
            await _context.ProductAccounts.Select(_ => _.DateFromPlan.Date).Distinct().ToListAsync()
        )
            .Select(_ => _.ToDayInfoString())
            .ToList();
    }

    public Task<ProductAccountDto> GetByIdAsync(Guid id)
    {
        return _context.ProductAccounts
            .Where(_ => _.Id == id)
            .ProjectTo<ProductAccountDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}
