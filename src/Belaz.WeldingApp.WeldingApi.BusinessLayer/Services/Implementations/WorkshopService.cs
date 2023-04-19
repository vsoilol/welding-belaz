using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.Workshop;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.Workshop;
using Belaz.WeldingApp.Common.Entities.Production;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WorkshopService : IWorkshopService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWorkshopRepository _workshopRepository;

    public WorkshopService(
        IValidationService validationService,
        IMapper mapper,
        IWorkshopRepository workshopRepository
    )
    {
        _validationService = validationService;
        _mapper = mapper;
        _workshopRepository = workshopRepository;
    }

    public Task<List<WorkshopDto>> GetAllAsync()
    {
        return _workshopRepository.GetAllAsync();
    }

    public async Task<Result<WorkshopDto>> GetByIdAsync(GetByIdRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(
            () => _workshopRepository.GetByIdAsync(request.Id)
        );
    }

    public async Task<Result<WorkshopDto>> CreateAsync(CreateWorkshopRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var workshop = _mapper.Map<Workshop>(request);

            return _workshopRepository.CreateAsync(workshop);
        });
    }

    public async Task<Result<WorkshopDto>> UpdateAsync(UpdateWorkshopRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(() =>
        {
            var workshop = _mapper.Map<Workshop>(request);

            return _workshopRepository.UpdateAsync(workshop);
        });
    }

    public async Task<Result<Unit>> DeleteAsync(DeleteWorkshopRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _workshopRepository.DeleteAsync(request.Id);
            return Unit.Default;
        });
    }
}
