﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.CalendarInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WorkingShiftRepository : IWorkingShiftRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WorkingShiftRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }
    
    public async Task<WorkingShiftDto> UpdateAsync(WorkingShift entity)
    {
        var updatedWorkingShift = (await _context.WorkingShifts
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedWorkingShift.Number = entity.Number;
        updatedWorkingShift.ShiftStart = entity.ShiftStart;
        updatedWorkingShift.ShiftEnd = entity.ShiftEnd;
        updatedWorkingShift.BreakStart = entity.BreakStart;
        updatedWorkingShift.BreakEnd = entity.BreakEnd;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    public async Task<WorkingShiftDto> CreateAsync(WorkingShift entity, int? year)
    {
        if (year is not null)
        {
            var calendar = await _context.Calendars
                .Where(_ => _.Year == year)
                .FirstOrDefaultAsync();
        
            if (calendar is null)
            {
                var newCalendar = new Calendar
                {
                    Year = (int)year,
                    IsMain = true
                };

                calendar = _context.Calendars.Add(newCalendar).Entity;
            }

            entity.CalendarId = calendar.Id;
        }

        var newWorkingShift = _context.WorkingShifts.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newWorkingShift.Id);
    }

    public Task<WorkingShiftDto> GetByIdAsync(Guid id)
    {
        return _context.WorkingShifts
            .Where(_ => _.Id == id)
            .ProjectTo<WorkingShiftDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }
}