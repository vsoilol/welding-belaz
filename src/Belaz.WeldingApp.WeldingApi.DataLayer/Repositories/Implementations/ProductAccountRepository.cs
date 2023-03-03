using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.ProductAccount;
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
