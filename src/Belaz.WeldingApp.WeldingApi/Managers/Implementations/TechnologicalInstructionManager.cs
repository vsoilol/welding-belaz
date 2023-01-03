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

    public TechnologicalInstructionManager(IMapper mapper,
        EntityFrameworkRepository<TechnologicalInstruction> technologicalInstructionRepository)
    {
        _mapper = mapper;
        _technologicalInstructionRepository = technologicalInstructionRepository;
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
}