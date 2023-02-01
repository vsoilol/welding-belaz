using AutoMapper;
using AutoMapper.QueryableExtensions;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
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
        List<WeldPassageInstruction> weldPassages)
    {
        entity.WeldPassageInstructions = weldPassages;
        var newTechnologicalInstruction = _context.TechnologicalInstructions.Add(entity).Entity;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(newTechnologicalInstruction.Id);
    }

    public async Task<TechnologicalInstructionDto> UpdateAsync(TechnologicalInstruction entity,
        List<WeldPassageInstruction> weldPassages)
    {
        var updatedTechnologicalInstruction = (await _context.TechnologicalInstructions
            .Include(_ => _.WeldPassageInstructions)
            .FirstOrDefaultAsync(_ => _.Id == entity.Id))!;

        updatedTechnologicalInstruction.Name = entity.Name;
        updatedTechnologicalInstruction.Number = entity.Number;

        var createdWelderPassages = weldPassages.Where(_ => _.Id == Guid.Empty).ToList();

        UpdateWeldPassages(updatedTechnologicalInstruction.WeldPassageInstructions, weldPassages);
        CreateWeldPassages(createdWelderPassages, updatedTechnologicalInstruction.Id);

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    private void UpdateWeldPassages(List<WeldPassageInstruction> updatedWelderPassages,
        List<WeldPassageInstruction> weldPassages)
    {
        foreach (var weldPassage in updatedWelderPassages)
        {
            var newWelderPassage = weldPassages.FirstOrDefault(_ => _.Id == weldPassage.Id);

            if (newWelderPassage is null)
            {
                continue;
            }

            weldPassage.Name = newWelderPassage.Name;
            weldPassage.ArcVoltageMax = newWelderPassage.ArcVoltageMax;
            weldPassage.ArcVoltageMin = newWelderPassage.ArcVoltageMin;
            weldPassage.PreheatingTemperatureMax = newWelderPassage.PreheatingTemperatureMax;
            weldPassage.PreheatingTemperatureMin = newWelderPassage.PreheatingTemperatureMin;
            weldPassage.WeldingCurrentMax = newWelderPassage.WeldingCurrentMax;
            weldPassage.WeldingCurrentMin = newWelderPassage.WeldingCurrentMin;
        }
    }

    private void CreateWeldPassages(List<WeldPassageInstruction> weldPassages, Guid technologicalInstructionId)
    {
        foreach (var weldPassage in weldPassages)
        {
            weldPassage.TechnologicalInstructionId = technologicalInstructionId;
        }

        _context.WeldPassageInstructions.AddRange(weldPassages);
    }
}