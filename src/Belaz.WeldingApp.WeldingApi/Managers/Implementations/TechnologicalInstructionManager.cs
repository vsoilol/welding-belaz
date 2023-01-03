using AutoMapper;
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

    public async Task CreateAsync(CreateInstructionRequest request)
    {
        var technologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);

        _technologicalInstructionRepository.Add(technologicalInstruction);
        await _technologicalInstructionRepository.SaveAsync();
    }

    public async Task UpdateAsync(UpdateInstructionRequest request)
    {
        var updatedTechnologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);

        var technologicalInstruction = await _technologicalInstructionRepository
            .AsQueryableByFilter(_ => _.Id == request.Id)
            .Include(_ => _.WeldPassages)
            .ThenInclude(_ => _.LayerInstruction)
            .FirstOrDefaultAsync();

        technologicalInstruction.Name = updatedTechnologicalInstruction.Name;
        technologicalInstruction.Number = updatedTechnologicalInstruction.Number;

        foreach (var weldPassage in technologicalInstruction.WeldPassages)
        {
            var newWelderPassage =
                updatedTechnologicalInstruction.WeldPassages.FirstOrDefault(_ => _.Id == weldPassage.Id);

            weldPassage.Name = newWelderPassage.Name;

            weldPassage.LayerInstruction.ArcVoltageMax = newWelderPassage.LayerInstruction.ArcVoltageMax;
            weldPassage.LayerInstruction.ArcVoltageMin = newWelderPassage.LayerInstruction.ArcVoltageMin;
            weldPassage.LayerInstruction.PreheatingTemperatureMax = newWelderPassage.LayerInstruction.PreheatingTemperatureMax;
            weldPassage.LayerInstruction.PreheatingTemperatureMin = newWelderPassage.LayerInstruction.PreheatingTemperatureMin;
            weldPassage.LayerInstruction.WeldingCurrentMax = newWelderPassage.LayerInstruction.WeldingCurrentMax;
            weldPassage.LayerInstruction.WeldingCurrentMin = newWelderPassage.LayerInstruction.WeldingCurrentMin;
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
    }
}