﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses.Workplace;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.Production;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class WorkplaceManager : IWorkplaceManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Workplace> _workplaceRepository;

    public WorkplaceManager(IMapper mapper, EntityFrameworkRepository<Workplace> workplaceRepository)
    {
        _mapper = mapper;
        _workplaceRepository = workplaceRepository;
    }

    public async Task<List<WorkplaceDto>> GetAllAsync()
    {
        return await _workplaceRepository
            .AsQueryable()
            .ProjectTo<WorkplaceDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
    
    public async Task<WorkplaceDto?> GetByIdAsync(Guid id)
    {
        return await _workplaceRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<WorkplaceDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}