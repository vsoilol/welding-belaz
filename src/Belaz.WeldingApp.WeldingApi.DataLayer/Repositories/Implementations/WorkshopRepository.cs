﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class WorkshopRepository : IWorkshopRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public WorkshopRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<WorkshopDto>> GetAllAsync()
    {
        return _context.Workshops
            .ProjectTo<WorkshopDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<WorkshopDto> GetByIdAsync(Guid id)
    {
        return _context.Workshops
            .Where(_ => _.Id == id)
            .ProjectTo<WorkshopDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<WorkshopDto> CreateAsync(Workshop entity)
    {
        var newWorkshop = _context.Workshops.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newWorkshop.Id);
    }

    public async Task<WorkshopDto> UpdateAsync(Workshop entity)
    {
        var updatedWorkshop = (await _context.Workshops.FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedWorkshop.Name = entity.Name;
        updatedWorkshop.Number = entity.Number;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }
}