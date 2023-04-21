using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class WeldPassageRepository : IWeldPassageRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WeldPassageRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByProductionAreaAndDatePeriodAsync(
        Guid productionAreaId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QueryWeldPassagesWithFilters(productId, seamId, startDate, endDate);

        query = query.Where(
            wp =>
                wp.WeldingRecord.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionAreaId == productionAreaId
                            : wp.Post!.ProductionAreaId == productionAreaId
                )
        );

        return query
            .ProjectTo<WeldPassageDeviationsDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWelderAndDatePeriodAsync(
        Guid welderId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QueryWeldPassagesWithFilters(productId, seamId, startDate, endDate);

        query = query.Where(wp => wp.WeldingTask.WelderId == welderId);

        return query
            .ProjectTo<WeldPassageDeviationsDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWorkplaceAndDatePeriodAsync(
        Guid workplaceId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QueryWeldPassagesWithFilters(productId, seamId, startDate, endDate);

        query = query.Where(
            wp => wp.WeldingRecord.WeldingEquipment.Workplaces.Any(wp => wp.Id == workplaceId)
        );

        return query
            .ProjectTo<WeldPassageDeviationsDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = QueryWeldPassagesWithFilters(productId, seamId, startDate, endDate);

        query = query.Where(
            wp =>
                wp.WeldingRecord.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionArea!.WorkshopId == workshopId
                            : wp.Post!.ProductionArea.WorkshopId == workshopId
                )
        );

        return query
            .ProjectTo<WeldPassageDeviationsDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    private IQueryable<WeldPassage> QueryWeldPassagesWithFilters(
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = _context.WeldPassages.Where(
            _ =>
                _.WeldingRecord.Date.Date <= endDate.Date
                && _.WeldingRecord.Date.Date >= startDate.Date
        );

        query = query.Where(_ => _.WeldingTask.SeamAccount.Seam.ProductId == productId);

        if (seamId is not null)
        {
            query = query.Where(_ => _.WeldingTask.SeamAccount.SeamId == seamId);
        }

        return query;
    }
}
