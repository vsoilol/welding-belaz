using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
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

    public async Task AssignProductAccountToWeldersAsync(
        Guid productAccountId,
        List<Guid> welderIds
    )
    {
        var productAccount = (
            await _context.ProductAccounts
                .Include(_ => _.Welders)
                .FirstOrDefaultAsync(_ => _.Id == productAccountId)
        )!;

        var welders = await _context.Welders
            .Where(_ => welderIds.Any(welderId => welderId == _.Id))
            .ToListAsync();

        productAccount.Welders = welders;

        await _context.SaveChangesAsync();
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
