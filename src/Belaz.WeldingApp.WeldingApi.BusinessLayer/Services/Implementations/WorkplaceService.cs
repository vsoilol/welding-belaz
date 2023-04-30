using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workplace;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workplace;
using Belaz.WeldingApp.Common.Entities.Production;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WorkplaceService : IWorkplaceService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWorkplaceRepository _workplaceRepository;

    public WorkplaceService(
        IValidationService validationService,
        IMapper mapper,
        IWorkplaceRepository workplaceRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _workplaceRepository = workplaceRepository;
    }

    public Task<List<WorkplaceDto>> GetAllAsync()
    {
        return _workplaceRepository.GetAllAsync();
    }

    public async Task<Result<WorkplaceDto>> GetByIdAsync(GetWorkplaceByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WorkplaceDto>(validationResult.Exception);
        }

        return await _workplaceRepository.GetByIdAsync(request.Id);
    }

    public async Task<Result<WorkplaceDto>> CreateAsync(CreateWorkplaceRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WorkplaceDto>(validationResult.Exception);
        }

        var workplace = _mapper.Map<Workplace>(request);

        return await _workplaceRepository.CreateAsync(workplace);
    }

    public async Task<Result<WorkplaceDto>> UpdateAsync(UpdateWorkplaceRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<WorkplaceDto>(validationResult.Exception);
        }

        var workplace = _mapper.Map<Workplace>(request);

        return await _workplaceRepository.UpdateAsync(workplace);
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWorkplaceRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        if (!validationResult.IsValid)
        {
            return new Result<Unit>(validationResult.Exception);
        }

        await _workplaceRepository.DeleteAsync(request.Id);
        return Unit.Default;
    }
}
