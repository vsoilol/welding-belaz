﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.Contracts.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Contracts.Responses;
using Belaz.WeldingApp.WeldingApi.Managers.Interfaces;
using Belaz.WeldingApp.WeldingApi.Repositories;
using Belaz.WeldingApp.WeldingApi.Repositories.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.Managers.Implementations;

public class TechnologicalInstructionManager : ITechnologicalInstructionManager
{
    private readonly IMapper _mapper;
    private readonly EntityFrameworkRepository<TechnologicalInstruction> _technologicalInstructionRepository;
    private readonly ApplicationContext _context;

    public TechnologicalInstructionManager(IMapper mapper,
        EntityFrameworkRepository<TechnologicalInstruction> technologicalInstructionRepository, ApplicationContext context)
    {
        _mapper = mapper;
        _technologicalInstructionRepository = technologicalInstructionRepository;
        _context = context;
    }

    public async Task<List<TechnologicalInstructionDto>> GetAllAsync()
    {
        return await _technologicalInstructionRepository
            .AsQueryable()
            .ProjectTo<TechnologicalInstructionDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public async Task<TechnologicalInstructionDto?> CreateAsync(CreateInstructionRequest request)
    {
        var technologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);

        var createdTechnologicalInstruction = _technologicalInstructionRepository.Add(technologicalInstruction);
        await _technologicalInstructionRepository.SaveAsync();
        
        return await _technologicalInstructionRepository
            .GetByIdAsQueryable(createdTechnologicalInstruction.Id)
            .ProjectTo<TechnologicalInstructionDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }

    public async Task<TechnologicalInstructionDto?> UpdateAsync(UpdateInstructionRequest request)
    {
        var updatedTechnologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);

        var technologicalInstruction = await _technologicalInstructionRepository
            .AsQueryableByFilter(_ => _.Id == request.Id)
            .Include(_ => _.WeldPassages)
            .FirstOrDefaultAsync();

        technologicalInstruction.Name = updatedTechnologicalInstruction.Name;
        technologicalInstruction.Number = updatedTechnologicalInstruction.Number;

        foreach (var weldPassage in technologicalInstruction.WeldPassages)
        {
            var newWelderPassage =
                updatedTechnologicalInstruction.WeldPassages.FirstOrDefault(_ => _.Id == weldPassage.Id);

            weldPassage.Name = newWelderPassage.Name;

            weldPassage.ArcVoltageMax = newWelderPassage.ArcVoltageMax;
            weldPassage.ArcVoltageMin = newWelderPassage.ArcVoltageMin;
            weldPassage.PreheatingTemperatureMax = newWelderPassage.PreheatingTemperatureMax;
            weldPassage.PreheatingTemperatureMin = newWelderPassage.PreheatingTemperatureMin;
            weldPassage.WeldingCurrentMax = newWelderPassage.WeldingCurrentMax;
            weldPassage.WeldingCurrentMin = newWelderPassage.WeldingCurrentMin;
        }

        var newWelderPassages = updatedTechnologicalInstruction.WeldPassages
            .Where(_ => _.Id == Guid.Empty);

        foreach (var weldPassage in newWelderPassages)
        {
            weldPassage.SeamId = technologicalInstruction.SeamId;
            weldPassage.TechnologicalInstructionId = technologicalInstruction.Id;
        }

        await _context.WeldPassages.AddRangeAsync(newWelderPassages);
        await _context.SaveChangesAsync();
        
        return await _technologicalInstructionRepository
            .GetByIdAsQueryable(request.Id)
            .ProjectTo<TechnologicalInstructionDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync();
    }
}