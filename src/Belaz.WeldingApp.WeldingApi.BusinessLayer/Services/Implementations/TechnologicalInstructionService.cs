using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.ProductInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class TechnologicalInstructionService : ITechnologicalInstructionService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly ITechnologicalInstructionRepository _technologicalInstructionRepository;

    public TechnologicalInstructionService(IValidationService validationService, IMapper mapper,
        ITechnologicalInstructionRepository technologicalInstructionRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _technologicalInstructionRepository = technologicalInstructionRepository;
    }

    public Task<List<TechnologicalInstructionDto>> GetAllAsync()
    {
        return _technologicalInstructionRepository.GetAllAsync();
    }

    public async Task<Result<TechnologicalInstructionDto>> CreateAsync(CreateInstructionRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var technologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);
            var weldPassages = _mapper.Map<List<WeldPassageInstruction>>(request.WeldPassages);

            return _technologicalInstructionRepository.CreateAsync(technologicalInstruction, weldPassages);
        });
    }

    public async Task<Result<TechnologicalInstructionDto>> UpdateAsync(UpdateInstructionRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var technologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);
            var weldPassages = _mapper.Map<List<WeldPassageInstruction>>(request.WeldPassages);

            return _technologicalInstructionRepository.UpdateAsync(technologicalInstruction, weldPassages);
        });
    }
}