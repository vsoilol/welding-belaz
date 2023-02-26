using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Extensions;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class ProductAccountRepository : IProductAccountRepository
{
    private readonly ApplicationContext _context;

    public ProductAccountRepository(ApplicationContext context)
    {
        _context = context;
    }

    public async Task<List<string>> GetAllDatesByProductionAreaAsync(Guid productionAreaId)
    {
        return (
            await _context.ProductAccounts.Select(_ => _.DateFromPlan.Date).Distinct().ToListAsync()
        )
            .Select(_ => _.ToDayInfoString())
            .ToList();
    }
}
