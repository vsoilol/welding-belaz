using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.DeviationsReportInfo;
using Belaz.WeldingApp.FileApi.Domain.Dtos.SeamPassportInfo;
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

    public Task<List<WeldPassageDeviationsDto>> GetAllDeviationsByWorkshopAndDatePeriodAsync(
        Guid workshopId,
        Guid productId,
        Guid? seamId,
        DateTime startDate,
        DateTime endDate
    )
    {
        var query = _context.WeldPassages.Where(
            wp =>
                wp.WeldingRecord.WeldingEquipment.Workplaces.Any(
                    wp =>
                        wp.PostId == null
                            ? wp.ProductionArea!.WorkshopId == workshopId
                            : wp.Post!.ProductionArea.WorkshopId == workshopId
                )
        );

        query = query.Where(
            _ =>
                _.WeldingRecord.Date.Date <= endDate.Date
                && _.WeldingRecord.Date.Date >= startDate.Date
        );
        query = query.Where(_ => _.WeldingTask.SeamAccount.Seam.ProductId == productId);

        if (seamId is not null)
        {
            query = query.Where(_ => _.WeldingTask.SeamAccount.SeamId == seamId);
        }

        return query
            .ProjectTo<WeldPassageDeviationsDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}
