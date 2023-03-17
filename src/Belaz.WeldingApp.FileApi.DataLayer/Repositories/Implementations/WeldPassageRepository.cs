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
        DateTime startDate,
        DateTime endDate
    )
    {
        var weldPassages = _context.WeldPassages.Where(
            _ =>
                _.WeldingRecord.WeldingEquipment.Workplaces.First().PostId == null
                    ? _.WeldingRecord.WeldingEquipment.Workplaces.First().ProductionArea!.WorkshopId
                        == workshopId
                    : _.WeldingRecord.WeldingEquipment.Workplaces
                        .First()
                        .Post!.ProductionArea.WorkshopId == workshopId
                        && _.WeldingRecord.Date.Date <= endDate.Date
                        && _.WeldingRecord.Date.Date >= startDate.Date
        );

        return weldPassages
            .ProjectTo<WeldPassageDeviationsDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}
