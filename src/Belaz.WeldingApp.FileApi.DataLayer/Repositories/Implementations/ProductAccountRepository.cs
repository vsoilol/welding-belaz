using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Enums;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos;
using Belaz.WeldingApp.FileApi.Domain.Dtos.ProductInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class ProductAccountRepository : IProductAccountRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public ProductAccountRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<
        List<ProductAccountBriefDto>
    > GetProductAccountBriefsByDatePeriodAndProductionAreaAsync(
        Guid productionAreaId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var productAccountQuery = _context.ProductAccounts.Where(
            _ =>
                _.Product.ProductionAreaId == productionAreaId
                && _.DateFromPlan >= startDate
                && _.DateFromPlan <= endDate
        );

        return productAccountQuery
            .ProjectTo<ProductAccountBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task UpdateAmountFromPlanAsync(Guid id, int amountFromPlan)
    {
        var productAccount = (await _context.ProductAccounts.FirstOrDefaultAsync(_ => _.Id == id))!;

        productAccount.AmountFromPlan = amountFromPlan;

        await _context.SaveChangesAsync();
    }

    public Task<ProductAccountAmountFromPlanDto?> GetByProductIdAndDateAsync(Guid productId, DateTime date)
    {
        return _context.ProductAccounts
            .Where(_ => _.DateFromPlan.Date == date.Date && _.ProductId == productId)
            .ProjectTo<ProductAccountAmountFromPlanDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task AddOnlyByProductAndAmountFromPlanAsync(Guid productId, DateTime date, int amountFromPlan)
    {
        var product = (await _context.Products.FirstOrDefaultAsync(_ => _.Id == productId))!;

        var maxProductAccountNumber = 0;

        if (await _context.ProductAccounts.AnyAsync(_ => _.DateFromPlan == date &&
                                                         _.Product.ProductionAreaId == product.ProductionAreaId))
        {
            maxProductAccountNumber = await _context.ProductAccounts
                .Where(_ => _.DateFromPlan == date &&
                            _.Product.ProductionAreaId == product.ProductionAreaId)
                .Select(_ => _.Number)
                .MaxAsync();
        }

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
            AmountFromPlan = amountFromPlan,
            DateFromPlan = date,
            ProductId = productId,
            ProductResults = productResultStatus,
            SeamAccounts = seamAccounts,
        };

        _context.ProductAccounts.Add(newProductAccount);
        await _context.SaveChangesAsync();
    }

    public Task<List<ProductAccountDto>> GetAllProductAccountsAsync()
    {
        return _context.ProductAccounts
            .OrderByDescending(_ => _.DateFromPlan)
            .ProjectTo<ProductAccountDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAndWorkplaceAsync(
        Guid workplaceId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var productAccountQuery = _context.ProductAccounts.Where(
            _ =>
                _.WeldingEquipments.Any(
                    equipment => equipment.Workplaces.Any(workplace => workplace.Id == workplaceId)
                )
                && _.DateFromPlan >= startDate
                && _.DateFromPlan <= endDate
        );

        return productAccountQuery
            .ProjectTo<ProductAccountBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAndWorkshopAsync(
        Guid workshopId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var productAccountQuery = _context.ProductAccounts.Where(
            _ =>
                _.Product.ProductionArea.WorkshopId == workshopId
                && _.DateFromPlan >= startDate
                && _.DateFromPlan <= endDate
        );

        return productAccountQuery
            .ProjectTo<ProductAccountBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<ProductAccountBriefDto>> GetProductAccountBriefsByDatePeriodAsync(
        DateTime startDate,
        DateTime endDate
    )
    {
        var productAccountQuery = _context.ProductAccounts.Where(
            _ => _.DateFromPlan >= startDate && _.DateFromPlan <= endDate
        );

        return productAccountQuery
            .ProjectTo<ProductAccountBriefDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}