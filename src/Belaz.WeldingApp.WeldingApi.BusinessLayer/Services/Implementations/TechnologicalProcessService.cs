using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.TechnologicalProcess;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TaskInfo;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.TechnologicalProcessInfo;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class TechnologicalProcessService : ITechnologicalProcessService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly ITechnologicalProcessRepository _technologicalProcessRepository;

    public TechnologicalProcessService(IValidationService validationService, IMapper mapper,
        ITechnologicalProcessRepository technologicalProcessRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _technologicalProcessRepository = technologicalProcessRepository;
    }

    public async Task<Result<TechnologicalProcessDto>> GetByIdAsync(GetTechnologicalProcessByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
            _technologicalProcessRepository.GetByIdAsync(request.Id));
    }

    public Task<List<TechnologicalProcessDto>> GetAllAsync()
    {
        return _technologicalProcessRepository.GetAllAsync();
    }

    public async Task<Result<TechnologicalProcessDto>> CreateAsync(CreateTechnologicalProcessRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var technologicalProcess = _mapper.Map<TechnologicalProcess>(request);

            return _technologicalProcessRepository.CreateAsync(technologicalProcess);
        });
    }

    public async Task<Result<TechnologicalProcessDto>> UpdateAsync(UpdateTechnologicalProcessRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var technologicalProcess = _mapper.Map<TechnologicalProcess>(request);

            return _technologicalProcessRepository.UpdateAsync(technologicalProcess);
        });
    }
}