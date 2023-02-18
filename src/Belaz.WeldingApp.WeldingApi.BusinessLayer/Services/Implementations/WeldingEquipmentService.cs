using AutoMapper;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Extensions;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Requests.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Interfaces;
using Belaz.WeldingApp.WeldingApi.BusinessLayer.Validations.Services;
using Belaz.WeldingApp.WeldingApi.DataLayer.Repositories.Interfaces;
using Belaz.WeldingApp.WeldingApi.Domain.Dtos.WeldingEquipment;
using Belaz.WeldingApp.WeldingApi.Domain.Entities.WeldingEquipmentInfo;
using LanguageExt;
using LanguageExt.Common;

namespace Belaz.WeldingApp.WeldingApi.BusinessLayer.Services.Implementations;

public class WeldingEquipmentService : IWeldingEquipmentService
{
    private readonly IValidationService _validationService;
    private readonly IMapper _mapper;
    private readonly IWeldingEquipmentRepository _weldingEquipmentRepository;

    public WeldingEquipmentService(IValidationService validationService, IMapper mapper,
        IWeldingEquipmentRepository weldingEquipmentRepository)
    {
        _validationService = validationService;
        _mapper = mapper;
        _weldingEquipmentRepository = weldingEquipmentRepository;
    }

    public Task<List<WeldingEquipmentDto>> GetAllAsync()
    {
        return _weldingEquipmentRepository.GetAllAsync();
    }

    public Task<List<WeldingEquipmentDowntimeDto>> GetAllWeldingEquipmentDowntimesAsync()
    {
        return _weldingEquipmentRepository.GetAllWeldingEquipmentDowntimesAsync();
    }

    public async Task<Result<WeldingEquipmentDto>> CreateAsync(CreateEquipmentRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var weldingEquipment = _mapper.Map<WeldingEquipment>(request);

            return _weldingEquipmentRepository.CreateAsync(weldingEquipment, request.WorkplaceIds);
        });
    }

    public async Task<Result<WeldingEquipmentDto>> UpdateAsync(UpdateEquipmentRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var weldingEquipment = _mapper.Map<WeldingEquipment>(request);

            return _weldingEquipmentRepository.UpdateAsync(weldingEquipment, request.WorkplaceIds);
        });
    }

    public async Task<Result<WeldingEquipmentDowntimeDto>> AddWeldingEquipmentDowntimeAsync(
        CreateWeldingEquipmentDowntimeRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var weldingEquipmentConditionTime = _mapper.Map<WeldingEquipmentConditionTime>(request);

            return _weldingEquipmentRepository.AddWeldingEquipmentDowntimeAsync(weldingEquipmentConditionTime);
        });
    }

    public async Task<Result<WeldingEquipmentDowntimeDto>> UpdateWeldingEquipmentDowntimeAsync(
        UpdateWeldingEquipmentDowntimeRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);
        
        return await validationResult.ToDataResult(() =>
        {
            var weldingEquipmentConditionTime = _mapper.Map<WeldingEquipmentConditionTime>(request);

            return _weldingEquipmentRepository.UpdateWeldingEquipmentDowntimeAsync(weldingEquipmentConditionTime);
        });
    }

    public async Task<Result<Unit>> AssignEquipmentsToWeldersAsync(AssignEquipmentsToWeldersRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _weldingEquipmentRepository
                .AssignEquipmentsToWeldersAsync(request.WeldingEquipmentIds, request.WelderIds);
            return Unit.Default;
        });
    }

    public async Task<Result<Unit>> AssignEquipmentsToMastersAsync(AssignEquipmentsToMastersRequest request)
    {
        var validationResult = await _validationService.ValidateAsync(request);

        return await validationResult.ToDataResult(async () =>
        {
            await _weldingEquipmentRepository
                .AssignEquipmentsToMastersAsync(request.WeldingEquipmentIds, request.MasterIds);
            return Unit.Default;
        });
    }
}