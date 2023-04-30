using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalInstruction;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalInstruction;
using Belaz.WeldingApp.Common.Entities.ProductInfo;
using Belaz.WeldingApp.Common.Entities.TaskInfo;
using Belaz.WeldingApp.Common.Entities.TechnologicalProcessInfo;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class TechnologicalInstructionService : ITechnologicalInstructionService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly ITechnologicalInstructionRepository _technologicalInstructionRepository;

    public TechnologicalInstructionService(
        IValidationService validationService,
        IMapper mapper,
        ITechnologicalInstructionRepository technologicalInstructionRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _technologicalInstructionRepository = technologicalInstructionRepository;
    }

    public Task<List<TechnologicalInstructionDto>> GetAllAsync()
    {
        return _technologicalInstructionRepository.GetAllAsync();
    }

    public async Task<Result<TechnologicalInstructionDto>> CreateAsync(
        CreateInstructionRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<TechnologicalInstructionDto>(validationResult.Exception);
        }

        var technologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);
        var weldPassages = _mapper.Map<List<WeldPassageInstruction>>(request.WeldPassages);

        return await _technologicalInstructionRepository.CreateAsync(
            technologicalInstruction,
            weldPassages
        );
    }

    public async Task<Result<TechnologicalInstructionDto>> UpdateAsync(
        UpdateInstructionRequest request
    )
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<TechnologicalInstructionDto>(validationResult.Exception);
        }

        var technologicalInstruction = _mapper.Map<TechnologicalInstruction>(request);
        var weldPassages = _mapper.Map<List<WeldPassageInstruction>>(request.WeldPassages);

        return await _technologicalInstructionRepository.UpdateAsync(
            technologicalInstruction,
            weldPassages
        );
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteInstructionRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _technologicalInstructionRepository.DeleteAsync(request.Id);
        return Unit.Default;
    }
}
