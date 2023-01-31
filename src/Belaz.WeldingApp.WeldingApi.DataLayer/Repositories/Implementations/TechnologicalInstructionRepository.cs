using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Microsoft.EntityFrameworkCore;

namespace Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Implementations;

public class TechnologicalInstructionRepository : ITechnologicalInstructionRepository
{
    private readonly ApplicationContext _context;
    private readonly IMapper _mapper;

    public TechnologicalInstructionRepository(ApplicationContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<List<TechnologicalInstructionDto>> GetAllAsync()
    {
        return _context.TechnologicalInstructions
            .ProjectTo<TechnologicalInstructionDto>(_mapper.ConfigurationProvider)
            .ToListAsync();
    }

    public Task<TechnologicalInstructionDto> GetByIdAsync(Guid id)
    {
        return _context.TechnologicalInstructions
            .Where(_ => _.Id == id)
            .ProjectTo<TechnologicalInstructionDto>(_mapper.ConfigurationProvider)
            .FirstOrDefaultAsync()!;
    }

    public async Task<TechnologicalInstructionDto> CreateAsync(TechnologicalInstruction entity,
        List<WeldPassage> weldPassages)
    {
        foreach (var weldPassage in weldPassages)
        {
            weldPassage.SeamId = entity.SeamId;
        }

        _context.WeldPassages.AddRange(weldPassages);
        var newTechnologicalInstruction = _context.TechnologicalInstructions.Add(entity).Entity;
        await _context.SaveChangesAsync();

        return await GetByIdAsync(newTechnologicalInstruction.Id);
    }

    public async Task<TechnologicalInstructionDto> UpdateAsync(TechnologicalInstruction entity,
        List<WeldPassage> weldPassages)
    {
        var updatedTechnologicalInstruction = (await _context.TechnologicalInstructions
            .Include(_ => _.Seam)
            .ThenInclude(_ => _.WeldPassages)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedTechnologicalInstruction.Name = updatedTechnologicalInstruction.Name;
        updatedTechnologicalInstruction.Number = updatedTechnologicalInstruction.Number;

        var createdWelderPassages = weldPassages.Where(_ => _.Id == Guid.Empty).ToList();
        
        UpdateWeldPassages(updatedTechnologicalInstruction.Seam.WeldPassages, weldPassages);
        CreateWeldPassages(createdWelderPassages, updatedTechnologicalInstruction.SeamId);
        
        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    private void UpdateWeldPassages(List<WeldPassage> updatedWelderPassages,
        List<WeldPassage> weldPassages)
    {
        foreach (var weldPassage in updatedWelderPassages)
        {
            var newWelderPassage = weldPassages.FirstOrDefault(_ => _.Id == weldPassage.Id)!;

            weldPassage.Name = newWelderPassage.Name;
            weldPassage.ArcVoltageMax = newWelderPassage.ArcVoltageMax;
            weldPassage.ArcVoltageMin = newWelderPassage.ArcVoltageMin;
            weldPassage.PreheatingTemperatureMax = newWelderPassage.PreheatingTemperatureMax;
            weldPassage.PreheatingTemperatureMin = newWelderPassage.PreheatingTemperatureMin;
            weldPassage.WeldingCurrentMax = newWelderPassage.WeldingCurrentMax;
            weldPassage.WeldingCurrentMin = newWelderPassage.WeldingCurrentMin;
        }
    }

    private void CreateWeldPassages(List<WeldPassage> weldPassages, Guid seamId)
    {
        foreach (var weldPassage in weldPassages)
        {
            weldPassage.SeamId = seamId;
        }

        _context.WeldPassages.AddRange(weldPassages);
    }
}