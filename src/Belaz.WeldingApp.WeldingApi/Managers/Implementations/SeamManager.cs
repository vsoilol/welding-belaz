﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.ProductInfo;
using Microsoft.EntityFrameworkCore;
using WeldingApp.Common.Enums;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class SeamManager : ISeamManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<Seam> _seamRepository;

    public SeamManager(EntityFrameworkRepository<Seam> seamRepository, IMapper mapper)
    {
        _seamRepository = seamRepository;
        _mapper = mapper;
    }

    public async Task<List<SeamDto>> GetAllByWeldingTaskStatus(Status status)
    {
        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.WeldingTask.Status == status)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<SeamDto?> GetByIdAsync(Guid id)
    {
        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.Id == id)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<List<SeamDto>> GetAllByControlSubject(bool isControlSubject)
    {
        return await _seamRepository
            .AsQueryable()
            .Where(_ => _.IsControlSubject == isControlSubject)
            .ProjectTo<SeamDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }
}