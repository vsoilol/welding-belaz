using System.Linq.Expressions;
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

    public async Task<List<TechnologicalInstructionDto>> GetAllAsync()
    {
        var technologicalInstructions = await FilterTechnologicalInstructions().ToListAsync();

        var mapTechnologicalInstructions = _mapper.Map<List<TechnologicalInstructionDto>>(
            technologicalInstructions
        );

        return mapTechnologicalInstructions;
    }

    public async Task<TechnologicalInstructionDto> GetByIdAsync(Guid id)
    {
        var technologicalInstruction = await FilterTechnologicalInstructions(_ => _.Id == id)
            .FirstOrDefaultAsync();

        var mapTechnologicalInstruction = _mapper.Map<TechnologicalInstructionDto>(
            technologicalInstruction
        );

        return mapTechnologicalInstruction;
    }

    public async Task<TechnologicalInstructionDto> CreateAsync(
        TechnologicalInstruction entity,
        List<WeldPassageInstruction> weldPassages
    )
    {
        entity.WeldPassageInstructions = weldPassages;
        var newTechnologicalInstruction = _context.TechnologicalInstructions.Add(entity).Entity;

        await _context.SaveChangesAsync();

        return await GetByIdAsync(newTechnologicalInstruction.Id);
    }

    public async Task<TechnologicalInstructionDto> UpdateAsync(
        TechnologicalInstruction entity,
        List<WeldPassageInstruction> weldPassages
    )
    {
        var updatedTechnologicalInstruction = (
            await _context.TechnologicalInstructions
                .Include(_ => _.WeldPassageInstructions)
                .FirstOrDefaultAsync(_ => _.Id == entity.Id)
        )!;

        updatedTechnologicalInstruction.Name = entity.Name;
        updatedTechnologicalInstruction.Number = entity.Number;

        var createdWelderPassages = weldPassages.Where(_ => _.Id == Guid.Empty).ToList();

        UpdateWeldPassages(updatedTechnologicalInstruction.WeldPassageInstructions, weldPassages);
        CreateWeldPassages(createdWelderPassages, updatedTechnologicalInstruction.Id);

        await _context.SaveChangesAsync();

        return await GetByIdAsync(entity.Id);
    }

    private void UpdateWeldPassages(
        List<WeldPassageInstruction> updatedWelderPassages,
        List<WeldPassageInstruction> weldPassages
    )
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

    private void CreateWeldPassages(
        List<WeldPassageInstruction> weldPassages,
        Guid technologicalInstructionId
    )
    {
        foreach (var weldPassage in weldPassages)
        {
            weldPassage.TechnologicalInstructionId = technologicalInstructionId;
        }

        _context.WeldPassageInstructions.AddRange(weldPassages);
    }

    public async Task DeleteAsync(Guid id)
    {
        var deletedTechnologicalInstruction = (
            await _context.TechnologicalInstructions
                .Include(_ => _.Seams)
                .FirstOrDefaultAsync(_ => _.Id == id)
        )!;

        _context.TechnologicalInstructions.Remove(deletedTechnologicalInstruction);
        await _context.SaveChangesAsync();
    }

    private IQueryable<TechnologicalInstruction> FilterTechnologicalInstructions(
        Expression<Func<TechnologicalInstruction, bool>> filter
    )
    {
        var technologicalInstructions = _context.TechnologicalInstructions
            .Include(_ => _.WeldPassageInstructions)
            .Include(_ => _.Seams)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Seams)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Seams)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess)
            .Where(filter);

        return technologicalInstructions;
    }

    private IQueryable<TechnologicalInstruction> FilterTechnologicalInstructions()
    {
        var technologicalInstructions = _context.TechnologicalInstructions
            .Include(_ => _.WeldPassageInstructions)
            .Include(_ => _.Seams)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .ThenInclude(_ => _.ProductMain)
            .ThenInclude(_ => _!.MainProduct)
            .Include(_ => _.Seams)
            .ThenInclude(_ => _.ProductionArea)
            .ThenInclude(_ => _!.Workshop)
            .Include(_ => _.Seams)
            .ThenInclude(_ => _.Product)
            .ThenInclude(_ => _!.TechnologicalProcess);

        return technologicalInstructions;
    }
}
