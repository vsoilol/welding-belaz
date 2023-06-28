using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.Common.Entities.CalendarInfo;
using Belaz.WeldingApp.FileApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.FileApi.Domain.Dtos.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.FileApi.DataLayer.Repositories.Implementations;

public class WorkingShiftRepository : IWorkingShiftRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WorkingShiftRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WorkingShiftDto>> GetWorkingShiftsByDatePeriodAsync(DateTime startDate, DateTime endDate)
    {
        var workingShifts = GetWorkingShiftsByPeriod(startDate, endDate)
            .Where(_ => _.Calendar!.IsMain);

        return workingShifts
            .ProjectTo<WorkingShiftDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<List<WorkingShiftDto>> GetWorkingShiftsByDatePeriodForWelderAsync(DateTime startDate,
        DateTime endDate,
        Guid? welderId)
    {
        var workingShifts = GetWorkingShiftsByPeriod(startDate, endDate)
            .Where(_ => !_.Calendar!.IsMain);

        if (await workingShifts.AnyAsync(_ => _.Calendar!.WelderId == welderId))
        {
            return await workingShifts.Where(_ => _.Calendar!.WelderId == welderId)
                .ProjectTo<WorkingShiftDto>(_mapper.ConfigurationProvider)
                .ToListAsync();
        }

        return await GetWorkingShiftsByDatePeriodAsync(startDate, endDate);
    }

    public async Task<List<WorkingShiftDto>> GetWorkingShiftsByDatePeriodForEquipmentAsync(DateTime startDate,
        DateTime endDate, Guid? weldingEquipmentId)
    {
        var workingShifts = GetWorkingShiftsByPeriod(startDate, endDate)
            .Where(_ => !_.Calendar!.IsMain);

        if (await workingShifts.AnyAsync(_ => _.Calendar!.WeldingEquipmentId == weldingEquipmentId))
        {
            return await workingShifts.Where(_ => _.Calendar!.WeldingEquipmentId == weldingEquipmentId)
                .ProjectTo<WorkingShiftDto>(_mapper.ConfigurationProvider)
                .ToListAsync();
        }

        return await GetWorkingShiftsByDatePeriodAsync(startDate, endDate);
    }

    private IQueryable<WorkingShift> GetWorkingShiftsByPeriod(DateTime startDate, DateTime endDate)
    {
        var workingShifts = _context.WorkingShifts
            .Where(_ => _.Calendar!.Year >= startDate.Year
                        && _.Calendar.Year <= endDate.Year);

        return workingShifts;
    }
}