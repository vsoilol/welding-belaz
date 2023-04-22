using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
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
